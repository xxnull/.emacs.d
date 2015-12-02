
(defconst emacs-built-in-themes (custom-available-themes)
  "List of built-in Emacs themes.")

(defface org-kbd
  '((t
     (:background "LemonChiffon1"
      :foreground "black"
      :box (:line-width 2 :color nil :style released-button))))
  "Face for displaying key bindings in Bootstrap documents."
  :group 'org-faces)

(defvar *bootstrap-themes* '(spacemacs-dark))

(defvar *bootstrap-current-theme* nil
  "The currently-used theme.")

(defconst *bootstrap-theme-name-to-package*
  '((spacemacs-dark  . spacemacs-theme)
    (spacemacs-light . spacemacs-theme)))

(defun bootstrap::get-theme-package (theme)
  (cond ((memq theme emacs-built-in-themes)
         nil)
        ((assq theme *bootstrap-theme-name-to-package*)
         (cdr (assq theme *bootstrap-theme-name-to-package*)))
        (t
         (intern (format "%S-theme" theme)))))

(defun bootstrap:load-theme (theme)
  (unless (memq theme (custom-available-themes))
    (cond ((or (eq theme 'spacemacs-light)
	       (eq theme 'spacemacs-dark))
           (bootstrap:load-or-install-package 'spacemacs-theme)
           (add-to-list 'load-path (bootstrap::get-package-directory
                                    'spacemacs-theme))
           (require 'spacemacs-common)
           (deftheme spacemacs-dark "Spacemacs theme, the dark version")
           (deftheme spacemacs-light "Spacemacs theme, the light version"))
          ((assq theme *bootstrap-theme-name-to-package*)
           (let* ((pkg (bootstrap::get-theme-package theme))
                  (pkg-dir (bootstrap:load-or-install-package pkg)))
             (add-to-list 'custom-theme-load-path pkg-dir)))
          (t
           (let ((pkg (bootstrap::get-theme-package theme)))
             (bootstrap:load-or-install-package pkg)))))
  (load-theme theme t))

(defadvice load-theme (after bootstrap:load-theme-adv activate)
  (let ((theme (ad-get-arg 0)))
    (setq *bootstrap-current-theme* theme)
    (bootstrap:post-theme-init theme)))

(defun bootstrap:post-theme-init (theme)
  (interactive)
  (when (fboundp 'bootstrap:set-flycheck-mode-line-faces)
    (bootstrap:set-flycheck-mode-line-faces))
  (when (fboundp 'bootstrap:customize-powerline-faces)
    (bootstrap:ustomize-powerline-faces))
  (when (fboundp 'powerline-reset)
    (powerline-reset)))

(provide 'bootstrap-theme-support)
