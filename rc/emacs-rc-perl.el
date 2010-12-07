;;; emacs-rc-perl.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

                                        ;(require 'cperl-mode)
(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl progs" t)
;; (setq cperl-hairy t)
(defun alexott/perl-mode-hook ()
  ;;       (setq tab-width 2)
  (local-set-key [return] 'newline-and-indent)
  (setq indent-tabs-mode nil)
  (line-number-mode 1)
  (column-number-mode 1)
  (abbrev-mode 1)
  (turn-on-eldoc-mode)
  (cperl-mode)
  (setq compile-command (concat "perl -cw " buffer-file-name))
  )
(add-hook 'perl-mode-hook 'alexott/perl-mode-hook)
(add-hook 'perl-mode-hook 'alexott/common-hook)
(add-hook 'perl-mode-hook 'alexott/common-prog-hook)

(setq cperl-auto-newline-after-colon t)
(setq cperl-autoindent-on-semi t)
(setq cperl-extra-newline-before-brace nil)
(setq cperl-indent-parens-as-block t)

;;; emacs-rc-perl.el ends here
