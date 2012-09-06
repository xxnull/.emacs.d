;;; -*- Mode: Emacs-Lisp -*-
;;;
;;; variables.el --- Various variables.
;;;
;;; Time-stamp: <Thursday Sep  6, 2012 12:01:41 asmodai>
;;; Revision:   13
;;;
;;; Copyright (c) 2011-2012 Paul Ward <asmodai@gmail.com>
;;;
;;; Author:     Paul Ward <asmodai@gmail.com>
;;; Maintainer: Paul Ward <asmodai@gmail.com>
;;; Created:    16 Feb 2011 13:32:41
;;; Keywords:   
;;; URL:        not distributed yet
;;;
;;;{{{ License:
;;;
;;; This program is free software: you can redistribute it
;;; and/or modify it under the terms of the GNU General Public
;;; Licenseas published by the Free Software Foundation,
;;; either version 3 of the License, or (at your option) any
;;; later version.
;;;
;;; This program isdistributed in the hope that it will be
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
;;;
;;;
;;;}}}

(setq user-url-address          "http://unixware.kicks-ass.org/"
      user-full-name            "Paul Ward"
      user-mail-address         "asmodai@gmail.com"
      url-personal-mail-address "asmodai@gmail.com")

;;;
;;; GNU Emacs-specific settings
(when emacs-p
  (setq scroll-step 1
        find-function-source-path nil
        font-menu-ignore-scale-fonts nil
        lookup-syntax-properties nil
        modeline-scrolling-method 'scrollbar))

;;;
;;; Info-specific settings
(setq Info-default-directory-list
      (append '("~/.emacs.d/info/") Info-default-directory-list))
(setq Info-additional-directory-list Info-default-directory-list)



;;;
;;; Common settings
(setq abbrev-mode t                     ; `abbrevs' needs to exist
      complex-buffers-menu-p t
      zmacs-regions t
      buffers-menu-grouping-function
         'group-buffers-menu-by-mode-then-alphabetically
      buffers-menu-sort-function 
         'sort-buffers-menu-by-mode-then-alphabetically
      buffers-menu-submenus-for-groups-p t
      case-fold-search t
      case-replace t
      get-frame-for-buffer-default-instance-limit nil
      mouse-yank-at-point 1
      next-line-adds-newlines nil
      overwrite-mode nil
      require-final-newline t
      teach-extended-commands-p t
      teach-extended-commands-timeout t)

(setq-default indicate-buffer-boundaries 'left
              indicate-empty-lines t)

;;; variables.el ends here
