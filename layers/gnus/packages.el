;;; -*- Mode: Emacs-Lisp -*-
;;;
;;; packages.el --- Gnus layer packages.
;;;
;;; Copyright (c) 2016 Paul Ward <asmodai@gmail.com>
;;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;;
;;; Author:     Paul Ward <asmodai@gmail.com>
;;; Maintainer: Paul Ward <asmodai@gmail.com>
;;; Created:    03 Apr 2016 03:22:06
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

(setq gnus-packages '(gnus
                      bbdb))

(defun gnus:init-bbdb ()
  (use-package bbdb
    :defer t
    :init
    (progn
      (setq bbdb-file "~/.emacs.d/bbdb")
      (bbdb-initialize 'gnus 'messsage)
      (setq bbdb-pop-up-window-size 10
            bbdb-mua-update-interactive-p '(query . create)
            bbdb-message-all-addresses t)

      (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

      (setq bbdb/mail-auto-create-p t
            bbdb/news-auto-create-p t)

      (add-hook 'message-mode-hook
                '(lambda ()
                   (flyspell-mode t)
                   (local-set-key "<TAB>" 'bbdb-complete-name)))

      (add-hook 'gnus-summary-mode-hook
                (lambda ()
                  (define-key gnus-summary-mode-map
                    (kbd ";")
                    'bbdb-mua-edit-field))))))

(defun gnus:init-gnus ()
  (use-package gnus
    :defer t
    :commands gnus
    :config
    (progn
      (setq gnus-select-method '(nnimap "gmail"
                                        (nnimap-address "imap.gmail.com")
                                        (nnimap-server-port "imaps")
                                        (nnimap-stream ssl))
            gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

      (setq message-send-mail-function 'smtpmail-send-it
            smtpmail-default-smtp-server "smtp.gmail.com"
            smtpmail-smtp-service 587)

      (setq gnus-use-correct-string-widths nil)

      ;; Disable all NNTP stuff
      (setq gnus-nntp-server nil
            gnus-read-active-file nil
            gnus-save-newsrc-file nil
            gnus-read-newsrc-file nil
            gnus-check-new-newsgroups nil)

      ;; Save copies in `Sent'.
      (setq gnus-message-archive-method '(nnimap "gmail"))

      ;; Fetch only part of the article if we can.
      (setq gnus-read-active-file 'some)

      ;; Tree view
      (add-hook 'gnus-group-mode 'gnus-topic-mode)

      (setq gnus-visible-headers
            "^From:\\|^Reply-To\\|^Organization:\\|^To:\\|^Cc:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Gnus")

      (setq gnus-sorted-header-list
            '("^From:" "^Reply-To" "^Organization:" "^To:" "^Cc:" "^Newsgroups:"
              "^Subject:" "^Date:" "^Gnus"))

      (setq-default
       gnus-always-read-dribble-file 1
       gnus-fetch-old-headers 250
       gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f  %B (%c) %s%)\n"
       gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
       gnus-group-line-format "%M%S%p%P%5y:%B %G\n";;"%B%(%g%)"
       gnus-topic-line-format "%i %A: %(%{%n%}%) %v\n"
       gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
       gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date)
       gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]"
       gnus-sum-thread-tree-false-root ""
       gnus-sum-thread-tree-indent " "
       gnus-sum-thread-tree-leaf-with-other "├► "
       gnus-sum-thread-tree-root ""
       gnus-sum-thread-tree-single-leaf "╰► "
       gnus-sum-thread-tree-vertical "│"
       gnus-article-browse-delete-temp t
       gnus-treat-strip-trailing-blank-lines 'last
       gnus-keep-backlog 'nil
       gnus-summary-display-arrow nil ; Don't show that annoying arrow:
       gnus-mime-display-multipart-related-as-mixed t ; Show more MIME-stuff:
       gnus-auto-select-first nil ; Don't get the first article automatically:
       smiley-style 'medium
       gnus-keep-backlog '0
       gnus-treat-display-smileys t
       gnus-treat-display-face t
       gnus-treat-display-x-face t
       gnus-treat-display-xface t
       gnus-treat-buttonize t
       gnus-treat-buttonize-head t
       gnus-use-cache t)

      (setq gnus-posting-styles
            '((".*"
               (signature "Sent from my Lisp Machine."))
              ((running-on-mbr15_pward-p)
               (address url-personal-mail-address)
               (signature "Sent from my other Lisp Machine."))))

      (require 'browse-url)
      (require 'nnrss)

      (autoload 'footnote-mode "footnote" nil t)
      (add-hook 'message-mode-hook 'footnote-mode)

      (defun bootstrap:browse-nnrss-url (arg)
        "Open an RSS article directory in a browser."
        (interactive "p")
        (let ((url (assq nnrss-url-field
                         (mail-header-extra
                          (gnus-data-header
                           (assq (gnus-summar-article-number)
                                 gnus-newsgroup-data))))))
          (if url
              (progn
                (browse-url (cdr url))
                (gnus-summary-mark-as-read-forward 1))
            (gnus-summary-scroll-up arg))))

      (add-to-list 'nnmail-extra-headers nnrss-url-field))))

;;; packages.el ends here.
