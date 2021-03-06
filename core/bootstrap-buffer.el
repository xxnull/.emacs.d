;;; -*- Mode: Emacs-Lisp -*-
;;;
;;; bootstrap-buffer.el --- Buffer functions.
;;;
;;; Copyright (c) 2016 Paul Ward <asmodai@gmail.com>
;;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;;
;;; Author:     Paul Ward <asmodai@gmail.com>
;;; Maintainer: Paul Ward <asmodai@gmail.com>
;;; Created:    03 Apr 2016 06:17:07
;;; Keywords:   
;;; URL:        not distributed yet
;;;
;;;{{{ License:
;;;
;;; This program is free software: you can redistribute it
;;; and/or modify it under the terms of the GNU General Public
;;; License as published by the Free Software Foundation,
;;; either version 3 of the License, or (at your option) any
;;; later version.
;;;
;;; This program is distributed in the hope that it will be
;;; useful, but WITHOUT ANY  WARRANTY; without even the implied
;;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;;; PURPOSE.  See the GNU General Public License for more
;;; details.
;;;
;;; You should have received a copy of the GNU General Public
;;; License along with this program.  If not, see
;;; <http://www.gnu.org/licenses/>.
;;;
;;;}}}
;;;{{{ Commentary:
;;;
;;;}}}

(defconst +bootstrap-buffer-name+ "*bootstrap*"
  "The name of the bootstrap buffer.")

(defconst +bootstrap-banner-length+ 50
  "Width of a banner.")

(defconst +bootstrap-buffer-cache-file+
  (expand-file-name (concat +bootstrap-cache-directory+ "bootstrap-buffer.el"))
  "Cache file for various persistent data for the startup buffer.")

(defvar bootstrap-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [tab]          'widget-forward)
    (define-key map (kbd "C-i")    'widget-forward)
    (define-key map [backtab]      'widget-backward)
    (define-key map (kbd "RET")    'widget-button-press)
    (define-key map [down-mouse-1] 'widget-button-click)
    map)
  "Key map for bootstrap mode.")

(define-derived-mode bootstrap-mode special-mode "Bootstrap"
  "Bootstrap major mode for the startup screen.

\\<bootstrap-mode-map>"
  :group 'bootstrap
  :syntax-table nil
  :abbrev-table nil
  (setq truncate-lines t)
  (linum-mode -1))

(defun bootstrap-buffer:set-mode-line (format)
  "Sets the modeline of the buffer named in `+bootstrap-buffer-name+' to the
value of FORMAT."
  (with-current-buffer (get-buffer-create +bootstrap-buffer-name+)
    (setq mode-line-format format)))

(defun bootstrap-buffer:message (msg &rest args)
  "Displays a message.

The message shall only be displayed if `*bootstrap-verbose*' is non-NIL."
  (when *bootstrap-verbose*
    (message "(Bootstrap) %s"
             (apply 'format msg args))))

(defun bootstrap-buffer:warning (msg &rest args)
  "Displays a warning."
  (message "(Bootstrap) Warning: %s"
           (apply 'format msg args)))

(defun bootstrap-buffer:append (msg &optional msgbuf)
  "Appends the text in MSG to the buffer named in `+bootstrap-buffer-name+'.

If MSGBUF is non-NIL, then the contents of MSG are also messaged to the user via
`message'."
  (with-current-buffer (get-buffer-create +bootstrap-buffer-name+)
    (goto-char (point-max))
    (let ((buffer-read-only nil))
      (insert msg)
      (if msgbuf
          (message "(Bootstrap) %s" msg)))
    (bootstrap-buffer:set-mode-line "")))

(defun bootstrap-buffer:replace-last-line (msg &optional msgbuf)
  "Replace the last line of the bootstrap buffer with MSG.

If MSGBUF is non-NIL then the message is also written to the message buffer."
  (with-current-buffer (get-buffer-create +bootstrap-buffer-name+)
    (goto-char (point-max))
    (let ((buffer-read-only nil))
      (delete-region (line-beginning-position) (point-max))
      (insert msg)
      (if msgbuf
          (message "(Bootstrap) %s" msg)))
    (bootstrap-buffer:set-mode-line "")))

(defun bootstrap-buffer:insert-page-break ()
  "Insert a page break character."
  (bootstrap-buffer:append "\n\n\n"))

(defun bootstrap-buffer::render-framed-line (line hpadding)
  (let* ((len (length line))
         (fill (- fill-column len)))
    (when (>= fill 0)
      (concat "│"
              (make-string hpadding ?\s)
              line
              (make-string fill ?\s)
              (make-string hpadding ?\s)
              "│\n"))))

(defun bootstrap-buffer::render-framed-text (content
                                             &optional width caption hpadding
                                             fill justify nosqueeze)
  (with-temp-buffer
    (if (not (file-exists-p content))
        (insert content)
      (insert-file-contents content)
      (goto-char (point-max))
      (delete-char -1))
    (let* ((hpadding (or hpadding 1))
           (fill-column (if width
                            (- width (+ 2 (* 2 hpadding)))
                          fill-column))
           (sentence-end-double-space nil)
           (ncaption (concat "┤ " caption " ├"))
           (caption-len (length ncaption)))
      (when fill
        (fill-region (point-min) (point-max) justify nosqueeze))
      (concat
       "┌─"
       (if ncaption
           (concat ncaption
                   (make-string (+ (- fill-column caption-len 1)
                                   hpadding) ?─))
         (make-string fill-column ?─))
       (make-string hpadding ?─)
       "┐\n"
       (bootstrap-buffer::render-framed-line "" hpadding)
       (mapconcat (lambda (x)
                    (bootstrap-buffer::render-framed-line x hpadding))
                  (split-string (buffer-string) "\n" t) "")
       (bootstrap-buffer::render-framed-line "" hpadding)
       "└"
       (make-string hpadding ?─)
       (make-string fill-column ?─)
       (make-string hpadding ?─)
       "┘"))))

(defun bootstrap-buffer:loading-animation ()
  (when *bootstrap-loading-progress-bar*
    (incf *bootstrap-loading-counter*)
    (when (>= *bootstrap-loading-counter*
              *bootstrap-loading-dots-chunk-threshold*)
      (setf *bootstrap-loading-counter* 0
            *bootstrap-loading-string*
              (concat *bootstrap-loading-string*
                      (make-string +bootstrap-loading-dots-chunk-size+
                                   +bootstrap-loading-char+)))
      (bootstrap-buffer:set-mode-line *bootstrap-loading-string*)
      (bootstrap:redisplay))))

(defsubst bootstrap-buffer::choose-text-banner ()
  "Choose a random text banner to display to the user."
  (let* ((files (directory-files +bootstrap-banner-directory+ t))
         (count (length files))
         (choice (+ 2 (random (- count 2)))))
    (nth choice files)))

(defmacro bootstrap-buffer::insert-shortcut (shortcut-char
                                             search-label
                                             &optional no-next-line)
  `(define-key bootstrap-mode-map
     ,shortcut-char
     (lambda ()
       (interactive)
       (unless (search-forward ,search-label (point-max) t)
         (search-backward ,search-label (point-min) t))
       ,@(unless no-next-line
           '((forward-line 1)))
       (back-to-indentation))))

(defun bootstrap-buffer::insert-file-list (list-display-name list)
  (when (car list)
    (insert list-display-name)
    (mapc (lambda (el)
            (insert "\n    ")
            (bootstrap-buffer:message el)
            (widget-create
             'push-button
             :action `(lambda (&rest junk)
                        (find-file-existing ,el))
             :mouse-face 'highlight
             :follow-link "\C-m"
             :button-prefix ""
             :button-suffix ""
             :format "%[%t%]"
             (abbreviate-file-name el)))
          list)))

(defun bootstrap-buffer::insert-bookmark-list (list-display-name list)
  (when (car list)
    (insert list-display-name)
    (mapc (lambda (el)
            (insert "\n    ")
            (widget-create
             'push-button
             :action `(lambda (&rest junk)
                        (bookmark-jump ,el))
             :mouse-face 'highlight
             :follow-link "\C-m"
             :button-prefix ""
             :button-suffix ""
             :format "%[%t%]"
             (format "%s - %s"
                     el
                     (abbreviate-file-name
                      (bookmark-get-filename el)))))
          list)))

;;; TODO: make this nicer.
(defun bootstrap-buffer::insert-buttons ()
  "Insert quick link buttons into the bootstrap-mode buffer."
  (goto-char (point-max))
  (insert "     ")
  (widget-create
   'push-button
   :help-echo "Connect to Lisp via SLIME."
   :action (lambda (&rest junk)
             (when (bootstrap-layer:layer-used-p 'slime)
               (slime-connect)))
   :mouse-face 'highlight
   :follow-link "\C-m"
   (propertize "Common Lisp" 'face 'font-lock-keyword-face))
  (insert " ")
  (widget-create
   'push-button
   :help-echo "Start an EShell session."
   :action (lambda (&rest junk)
             (eshell))
   :mouse-face 'highlight
   :follow-link "\C-m"
   (propertize "EShell" 'face 'font-lock-keyword-face))
  (insert " ")
  (widget-create
   'push-button
   :help-echo "Start an Interactive Emacs Lisp session."
   :action (lambda (&rest junk)
             (ielm))
   :mouse-face 'highlight
   :follow-link "\C-m"
   (propertize "IELM" 'face 'font-lock-keyword-face))
  (insert " ")
  (widget-create
   'push-button
   :help-echo "Read your mail!"
   :action (lambda (&rest junk)
             (gnus))
   :mouse-face 'highlight
   :follow-link "\C-m"
   (propertize "Gnus" 'face 'font-lock-keyword-face))
  (insert "\n     ")
  (widget-create
   'push-button
   :hekp-echo "Start the Sunrise Commander."
   :action (lambda (&rest junk)
             (sunrise))
   :mouse-face 'highlight
   :follow-link "\C-m"
   (propertize "Sunrise" 'face 'font-lock-keyword-face))
  (insert "\n"))

(defun bootstrap-buffer::get-host-from-fqdn ()
  (first (split-string (system-name) "\\.")))

(defun bootstrap-buffer::generate-info-text ()
  (format (concat "%s: %s\n"
                  "%s: %s\n"
                  "%s: %s\n"
                  "%s: %s\n")
          (propertize "User"
                      'face 'font-lock-comment-face)
          (propertize user-login-name
                      'face 'font-lock-function-name-face)
          (propertize "Host"
                      'face 'font-lock-comment-face)
          (propertize (bootstrap-buffer::get-host-from-fqdn)
                      'face 'font-lock-function-name-face)
          (propertize "Mode"
                      'face 'font-lock-comment-face)
          (propertize (cond ((and (terminal-p)
                                  (256-colour-p))
                             "Terminal/256")
                            ((and (terminal-p)
                                  (not (256-colour-p)))
                             "Terminal")
                            (t
                             "Graphical"))
                      'face 'font-lock-function-name-face)
          (propertize "Hash"
                      'face 'font-lock-comment-face)
          (propertize (bootstrap:git-head-short-hash)
                      'face 'font-lock-function-name-face)))

(defun bootstrap-buffer::generate-info ()
  "Generate Emacs information for the startup screen."
  (let ((string (bootstrap-buffer::generate-info-text))
        (caption (format "%s %s"
                         (propertize "GNU Emacs"
                                     'face 'font-lock-keyword-face)
                         (propertize emacs-version
                                     'face 'font-lock-function-name-face))))
    (bootstrap-buffer::render-framed-text
     string
     (- 78 +bootstrap-banner-length+)
     caption
     1)))

(defun bootstrap-buffer::insert-version ()
  "Insert various Emacs information into the startup screen."
  (with-current-buffer (get-buffer-create +bootstrap-buffer-name+)
    (save-excursion
      (let* ((lines (split-string (bootstrap-buffer::generate-info) "\n"))
             (count 1)
             (maxcol +bootstrap-banner-length+)
             (buffer-read-only nil))
        (dolist (line lines)
          (beginning-of-buffer)
          (forward-line count)
          (move-to-column maxcol t)
          (insert line)
          (incf count))))))
  
(defun bootstrap-buffer::insert-banner ()
  "Insert the banner into the startup screen."
  (let ((banner (bootstrap-buffer::choose-text-banner))
        (buffer-read-only nil))
    (erase-buffer)
    (when banner
      (bootstrap-buffer:message (format "Banner: %s" banner))
      (insert-file-contents banner)
      (bootstrap-buffer::insert-version))
    (bootstrap-buffer::insert-buttons)))

(defun bootstrap-buffer:startup-screen ()
  "Creates the startup screen and inserts the banner."
  (switch-to-buffer (get-buffer-create +bootstrap-buffer-name+))
  (bootstrap-buffer:set-mode-line "")
  (bootstrap-buffer::insert-banner)
  (bootstrap-mode)
  (bootstrap:redisplay)
  (goto-char (point-min)))

(provide 'bootstrap-buffer)

;;; bootstrap-buffer.el ends here.
