;;; -*- Mode: Emacs-Lisp -*-

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-default-style (quote ((c-mode . "bsd") (lsl-mode . "bsd") (csharp-mode . "bsd") (c++-mode . "bsd") (cc-mode . "bsd") (objc-mode . "gnu") (java-mode . "java") (other . "gnu"))))
 '(column-number-mode t)
 '(ecb-cache-directory-contents (quote (("^/\\([^:/]*@\\)?\\([^@:/]*\\):.*" . 0) (".*" . 50) ("*.*.~*~" . 1000))))
 '(ecb-options-version "2.31")
 '(ecb-prescan-directories-for-emptyness nil)
 '(ecb-source-file-regexps (quote ((".*" nil nil))))
 '(ecb-source-path (quote (("/" "/"))))
 '(erc-fool-highlight-type (quote all))
 '(erc-fools (quote ("\\\\(echelon\\\\)" "\\\\(silentnoise\\\\)")))
 '(erc-modules (quote (autojoin button capab-identify completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track unmorse)))
 '(erc-nick "AsmoEMACS")
 '(erc-nick-uniquifier "`")
 '(erc-pal-highlight-type (quote all))
 '(erc-pals (quote ("\\\\(booto\\\\)" "\\\\(wa1800z\\\\)" "\\\\(enstyne\\\\)" "\\\\(BSDGurl\\\\)" "\\\\(int16h\\\\)")))
 '(erc-paranoid t)
 '(erc-user-full-name "Paul")
 '(font-lock-mode t t (font-lock))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(gutter-buffers-tab-visible-p t t)
 '(gutters-buffers-tab-visible-p t t)
 '(header-copyright-notice "")
 '(header-date-format t)
 '(hl-paren-background-colors nil)
 '(hl-paren-colors (quote ("firebrick1" "DarkRed" "IndianRed" "LightCoral" "Salmon" "DarkSalmon")))
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(paren-mode (quote paren) nil (paren))
 '(safe-local-variable-values (quote ((Package . DARK-HERESY) (Package . HUNCHENTOOT) (Package . dark-heresy) (folded-file . t) (Fonts . CPTFONT\,CPTFONTI\,CPTFONTCB) (Package . dw) (Fill . Yes) (auto-fill-mode . Yes) (Package . TERMINAL-DRIVER) (Package . System-internals) (Package . UT) (Package . COMMAND-PROCESSOR) (Package . DYNAMIC-TTY) (Package . XLIB) (Package . NULISP-COLD) (Package ARCH :use CL) (Package . NULISP) (Package . NULISP-INTERNALS) (Package . LISP-MACHINE) (Readtable . ZL) (Package . MACINTOSH-INTERNALS) (Package . RPC) (Syntax . Lisp+C) (Package . TCP) (Default-character-style :fix :roman :normal) (Syntax . ansi-common-lisp) (Patch-File . Yes) (Package . NETWORK-INTERNALS) (Package . FLAVOR) (Package . DIS) (Package . FED) (Package . C-user) (Package . CLtL-Internals) (Package . user) (Syntax . common-lisp) (Package ddex :use SCL) (Package . COMMON-LISP-INTERNALS) (Package . JOSHUA-INTERNALS) (Package . Nsage) (Package . SCT) (Package . NSAGE) (Package . http) (Syntax . Ansi-Common-Lisp) (Package . FTP) (Readtable . CL) (Package WHY-PC GLOBAL) (Package . CL-NAMESPACE) (Package . CL-STARTUP) (Package . DYNAMIC-WINDOWS) (Package . CLUEI) (Fonts CPTFONT HL10B) (Fonts TR12 HL12B TR12I CPTFONT HL10 CPTFONTB) (Cold-Load . t) (Package . SYS) (Cold-load . T) (Fonts Cptfont Cptfontb Hl12bi Cptfont Medfnb) (Fonts Cptfont Cptfontb Hl12bi) (Package . Name) (Cold-Load . T) (Package . NAME) (Package . CL-HACKS-CLOS) (Package . CL-HACKS-FAD) (Package . CL-HACKS-UUID) (Package . CL-FAD) (Package . CL-HACKS-INTERNALS) (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/63/LISPparsergen/RCS/defsys.lisp,v 1.9.13.1 2009/08/21 21:14:37 davef Exp $") (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/63/LISPeditor/RCS/shell-defsys.lisp,v 1.1.15.1 2009/08/21 21:12:51 davef Exp $") (rcs-header . "$Header: /hope/lwhope1-cam/hope.0/compound/42/LISPccl/RCS/prof-defsys.lisp,v 1.7.1.1 2009/08/21 21:12:19 davef Exp $") (Package . CL-HACKS-MOP) (Package . CL-MUD) (Package . DOMAIN-NAME-SYSTEM) (Package . NEKO) (Fonts CPTFONT HL12B HL12I) (Package . FILE-SYSTEM) (Package . DEMO) (Fonts medfnt hl12b) (Font . CPTFONT) (Package REMIND :size 100) (Fonts CPTFONT HL12BI HL12B) (Package . CP) (Package . IVT) (Fonts cptfont HL12B HL12BI) (Package . TELNET) (Fonts MEDFNT MEDFNB HL12B) (Fonts CPTFONT HL10B TR10BI TR10I) (Fonts MEDFNB hl12B hl12bi) (Fonts MEDFNB HL12B HL12BI) (Package . X11) (Package . UA) (Readtable . T) (Fonts CPTFONT CPTFONTB) (\1Mode . Common-Lisp) (\*cold-load . t) (Package . Compiler2) (FONTS cptfont hl10b) (PACKAGE . user) (BASE . 10) (Package . System-Internals) (Package . LT) (Package . Common-lisp-internals) (Package . FCLI) (movitz-mode . t) (Package . COMPILER) (TeX-master . t) (Package . SCHEME-USER) (Fonts CPTFONT HL10B HL12BI) (Package . UCL) (Package . Scheme) (Patch-file . T) (Fonts CPTFONT HL12B HL12BI) (Package . SI) (Patch-file) (Fonts CPTFONT CPTFONTB HL12BI) (Package . Compiler) (Package . c-system) (Package . SYSTEM-APPLICATIONS) (Package . FS) (Fonts MEDFNT HL12B HL12I MEDFNB) (Fonts . CPTFONT\,HL12B\,HL12BI) (Package . TV) (Patch-File . t) (Fonts cptfont) (Package . Net) (Fonts CPTFONT HL12 HL12BI CPTFONTB) (Package . W) (Fonts CPTFONT HL12 TR12I COURIER ADOBE-COURIER14B HL12B CPTFONTBI) (Vsp . 0) (Fonts MEDFNT HL12B HL12BI) (Fonts . hl12\,HL12B\,HL12BI) (Fonts . cptfont\,HL12\,HL12BI\,cptfontb) (Package . User) (Package "CONDITIONS" :USE "LISP" :SHADOW ("BREAK" "ERROR" "CERROR" "SIGNAL" "CHECK-TYPE" "ASSERT" "ETYPECASE" "CTYPECASE" "ECASE" "CCASE" "IGNORE-ERRORS" "MAKE-CONDITION" "WARN" "*BREAK-ON-WARNINGS*")) (Package . X-SCREEN) (Package . ZETALISP-USER) (Package . CLEAT\.DATASTORE\.UTILS) (Package . ZETALISP) (Package color-palette) (Patch-File . T) (Package . CLEAT\.DATASTORE\.INDICES) (Package . CLEAT\.DATASTORE\.XML-IMPORT/EXPORT) (Package . CLEAT\.DATASTORE\.XML-IMPORTER) (Package . CLEAT\.DATASTORE\.XML) (Package . CLEAT\.DATASTORE\.DATA) (Package . DATASTORE) (Package . COLOR) (Syntax . ZETALISP) (Package . SYSTEM-INTERNALS) (Package . POSTSCRIPT) (Package . DBFS) (Package . SPITFIRE-CORE) (Package . cl-user) (Package . SPITFIRE-WINDOWS) (Package . RUNES) (Package . CCL) (Package . ccl) (Base . 8) (Package . ZWEI) (Syntax . Zetalisp) (Package . CURSES) (Package . DREI-BUFFER) (Package . METASIM-CLIM) (Package . CLIM-USER) (Package . CLIM-INTERNALS) (Syntax . Common-lisp) (Package . CL-DOC) (Package . TERMINFO) (Syntax . ANSI-Common-Lisp) (Package . METASIM-UTILS) (Package . CL-HACKS) (eval add-hook (quote write-file-hooks) (quote time-stamp)) (Package . COMMON-LISP-USER) (Syntax . COMMON-LISP) (Package . Destiny) (Package . DESTINY) (Package . METASIM) (Lowercase . Yes) (Package . CL-USER) (Syntax . ANSI-COMMON-LISP) (Lowercase . T) (Package . USER) (Package . C-SYSTEM) (Base . 10) (Syntax . Common-Lisp))))
 '(show-paren-mode t)
 '(toolbar-captioned-p nil)
 '(url-be-asynchronous t)
 '(url-personal-mail-address "asmodai@gmail.com")
 '(url-privacy-level (quote (os agent)))
 '(user-full-name "Paul Ward")
 '(user-mail-address "asmodai@gmail.com")
 '(user-url-address "http://unixware.kicks-ass.org/" t)
 '(w3-default-homepage "http://localhost/"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :height 110 :width normal :foundry "apple" :family "Monaco"))))
 '(about-headling-face ((t (:foreground "hotpink" :bold t))))
 '(about-link-face ((t (:foreground "steelblue" :underline t))))
 '(blank-space-face ((t (nil))))
 '(blank-tab-face ((t (nil))))
 '(blue ((t (:foreground "blue"))))
 '(bold ((t (:bold t))))
 '(bold-italic ((t (:italic t :bold t))))
 '(border ((t (nil))))
 '(border-glyph ((t (nil))))
 '(buffers-tab ((t (:background "gray65" :foreground "black" :bold t))))
 '(calendar-today-face ((t (:foreground "hotpink" :bold t))))
 '(cperl-array-face ((t (:foreground "skyblue" :bold t))))
 '(cperl-hash-face ((t (:foreground "hotpink" :bold t))))
 '(cperl-here-face ((t (:foreground "green" :background "grey25" :bold t))))
 '(cperl-nonoverridable-face ((t (:foreground "chartreuse3"))))
 '(cperl-pod-face ((t (:foreground "firebrick"))))
 '(cperl-pod-head-face ((t (:foreground "green3"))))
 '(cursor ((t (:background "green3"))))
 '(custom-button ((t (:bold t))))
 '(custom-button-unraised ((t (:background "grey65" :foreground "black"))))
 '(custom-changed ((t (:foreground "white" :background "royalblue" :bold t))))
 '(custom-comment ((t (:background "gray15"))))
 '(custom-documentation ((t (:foreground "green2"))))
 '(custom-face-tag ((t (:foreground "royalblue"))))
 '(custom-group-tag ((t (:underline t :foreground "cadetblue"))))
 '(custom-invalid ((t (:foreground "yellow" :background "red"))))
 '(custom-modified ((t (:foreground "white" :background "blue"))))
 '(custom-rogue ((t (:foreground "pink" :background "black"))))
 '(custom-saved ((t (:underline t))))
 '(custom-set ((t (:foreground "blue" :background "white"))))
 '(custom-state ((t (:foreground "goldenrod3"))))
 '(custom-variable-button ((t (:bold t :underline t :foreground "firebrick"))))
 '(custom-variable-tag ((t (:underline t :foreground "mediumorchid"))))
 '(cyan ((t (:foreground "cyan"))))
 '(dired-face-directory ((t (:bold t))))
 '(erc-capab-identify-unidentified ((t (:foreground "firebrick"))))
 '(erc-current-nick-face ((t (:foreground "turquoise" :bold t))))
 '(erc-header-line ((t (:background "gray30" :foreground "gray70"))))
 '(erc-input-face ((t (:foreground "cadetblue"))))
 '(erc-my-nick-face ((t (:foreground "cadetblue" :bold t))))
 '(erc-nick-default-face ((t (:bold t))))
 '(erc-pal-face ((t (:foreground "darkmagenta" :bold t))))
 '(erc-prompt-face ((t (:background "black" :foreground "lightblue2" :bold t))))
 '(erc-timestamp-face ((t (:foreground "green4" :bold t))))
 '(font-latex-verbatim-face ((t (:foreground "salmon" :bold t))))
 '(font-lock-builtin-face ((t (:foreground "mediumorchid"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "steelblue"))))
 '(font-lock-comment-face ((t (:foreground "mediumaquamarine"))))
 '(font-lock-constant-face ((t (:foreground "goldenrod3"))))
 '(font-lock-doc-face ((t (:foreground "forestgreen"))))
 '(font-lock-function-name-face ((t (:foreground "yellow" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "salmon"))))
 '(font-lock-negation-char-face ((t (:background "grey10" :foreground "firebrick"))))
 '(font-lock-preprocessor-face ((t (:foreground "magenta4"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "grey50" :bold t))))
 '(font-lock-string-face ((t (:foreground "lawngreen"))))
 '(font-lock-type-face ((t (:foreground "chocolate"))))
 '(font-lock-variable-name-face ((t (:foreground "orangered" :bold t))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "grey3"))))
 '(green ((t (:foreground "green"))))
 '(gui-button-face ((t (:background "gray75"))))
 '(gui-element ((t (:background "gray80"))))
 '(highlight ((t (:background "gray20" :foreground "firebrick"))))
 '(highlight-changes-delete-face ((t (:underline t :foreground "red"))))
 '(highlight-changes-face ((t (:foreground "red"))))
 '(highline-face ((t (:background "grey95"))))
 '(hyper-apropos-documentation ((t (:foreground "forestgreen"))))
 '(hyper-apropos-heading ((t (:bold t :foreground "skyblue"))))
 '(hyper-apropos-hyperlink ((t (:foreground "slateblue" :underline t))))
 '(hyper-apropos-major-heading ((t (:foreground "steelblue" :bold t))))
 '(hyper-apropos-section-heading ((t (:foreground "cadetblue" :bold t))))
 '(hyper-apropos-warning ((t (:foreground "red" :bold t))))
 '(ibuffer-occur-match-face ((t (:foreground "firebrick"))))
 '(info-node ((t (:foreground "steelblue" :bold t))))
 '(info-xref ((t (:foreground "slateblue" :bold t :underline t))))
 '(isearch ((t (:background "gray10" :foreground "azure"))))
 '(isearch-fail ((t (:foreground "red" :bold t))))
 '(isearch-secondary ((t (:foreground "red3"))))
 '(italic ((t (:italic t))))
 '(lazy-highlight ((t (:background "gray20" :foreground "aquamarine"))))
 '(linemenu-face ((t (nil))))
 '(link ((t (:foreground "slateblue" :underline t))))
 '(link-visited ((t (:foreground "magenta3" :underline t))))
 '(magenta ((t (:foreground "magenta"))))
 '(man-italic ((t (:foreground "blanchedalmond" :italic t))))
 '(minibuffer-prompt ((t (:foreground "purple"))))
 '(mode-line ((t (:foreground "black" :background "gray70"))))
 '(mode-line-buffer-id ((t (:background "gray70" :foreground "darkgreen"))))
 '(modeline-mousable ((t (:background "gray70" :foreground "darkblue"))))
 '(modeline-mousable-minor-mode ((t (:background "gray70" :foreground "firebrick"))))
 '(primary-selection ((t (:background "gray20" :foreground "turquoise"))))
 '(red ((t (:foreground "red"))))
 '(region ((t (:background "gray20" :foreground "yellow"))))
 '(right-margin ((t (nil))))
 '(secondary-selection ((t (:background "gray20" :foreground "paleturquoise"))))
 '(show-paren-match ((t (:background "gray15" :foreground "lawngreen" :bold t))))
 '(show-paren-mismatch ((t (:background "gray15" :foreground "red" :bold t))))
 '(sldb-restart-number-face ((t (:bold t))))
 '(slime-inspector-value-face ((t (:foreground "mediumblue" :bold t))))
 '(slime-reader-conditional-face ((t (:foreground "DimGray" :bold t))))
 '(slime-repl-input-face ((t (:bold t))))
 '(slime-repl-output-mouseover-face ((t (:bold t))))
 '(text-cursor ((t (:background "green3"))))
 '(tool-bar ((t (:background "grey" :foreground "black"))))
 '(toolbar ((t (:background "grey" :foreground "black"))))
 '(tooltip ((t (:background "lightyellow" :foreground "black"))))
 '(underline ((t (:underline t))))
 '(vcursor ((t (:background "lawngreen"))))
 '(vertical-divider ((t (:background "gray70" :foreground "black"))))
 '(white ((t (:foreground "white"))))
 '(widget-button ((t (:bold t))))
 '(widget-button-pressed ((t (:foreground "red"))))
 '(widget-documentation ((t (:foreground "green4" :italic t))))
 '(widget-field ((t (:background "gray15"))))
 '(widget-inactive ((t (:foreground "gray40" :background "gray10"))))
 '(widget-single-line-field ((t (:background "gray15"))))
 '(yellow ((t (:foreground "yellow"))))
 '(zmacs-region ((t (:background "gray20" :foreground "yellow")))))
