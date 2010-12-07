;;; emacs-rc-prog-misc.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-prog-misc.el,v 0.0 2003/11/20 11:30:47 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; setup some variables explicitly
(setenv "CVS_RSH" "ssh")

;; gtags
(autoload 'gtags-mode "gtags" "" t)

;; Working with RPM specs
(autoload 'rpm-spec-mode "rpm-spec-mode" "RPM spec mode." t)
(add-to-list 'auto-mode-alist '("\\.spec$" . rpm-spec-mode))

;;
(autoload 'smerge-mode "smerge-mode" nil t)

;;
(autoload 'po-mode "po-mode"  "Major mode for translators to edit PO files" t)
(add-to-list 'auto-mode-alist '("\\.po$\\|\\.po\\." . po-mode))

;;
(require 'imenu)

;; whitespace mode
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(setq whitespace-style '(trailing lines space-before-tab indentation space-after-tab)
      whitespace-line-column 400)
(custom-set-variables
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode clojure-mode)))
 '(whitespace-silent t))

;;
(autoload 'rebox-comment "rebox" nil t)
(autoload 'rebox-region "rebox" nil t)

;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode lisp-mode
                            c-mode c++-mode js2-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode
                            scheme-mode clojure-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defadvice yank (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(defadvice yank-pop (after indent-region activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (member major-mode yank-indent-modes)
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

;; company-mode
;; (require 'company-mode)
;; (require 'company-bundled-completions)
;; (company-install-bundled-completions-rules)

;;
(autoload 'paredit-mode "paredit" "Minor mode for pseudo-structurally editing Lisp code." t)
(require 'eldoc)
(eldoc-add-command 'paredit-backward-delete 'paredit-close-round)

;; Go Language
(require 'go-mode-load)


;;; emacs-prog-misc.el ends here

