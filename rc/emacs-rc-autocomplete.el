;;; emacs-rc-autocomplete.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'auto-complete)
;; (require 'auto-complete-extension)
(require 'auto-complete-yasnippet nil t)
(require 'auto-complete-semantic nil t)

;;; Code:

;; Generic setup.
(global-auto-complete-mode t)           ;enable global-mode
(setq ac-auto-start nil)                ;automatically start (disabled)
(setq ac-dwim t)                        ;Do what i mean
(setq ac-override-local-map nil)        ;don't override local map

(setq ac-modes
      '(emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode
                        c-mode cc-mode c++-mode java-mode
                        perl-mode cperl-mode python-mode ruby-mode
                        ecmascript-mode javascript-mode php-mode css-mode
                        makefile-mode sh-mode fortran-mode f90-mode ada-mode
                        xml-mode sgml-mode
                        haskell-mode literate-haskell-mode
                        emms-tag-editor-mode
                        asm-mode
                        org-mode))

;; The sources for common all mode.
(custom-set-variables
 '(ac-sources
   '(
     ;; ac-source-yasnippet   ;this source need file `auto-complete-yasnippet.el'
     ;; ac-source-semantic    ;this source need file `auto-complete-semantic.el'
     ac-source-imenu
     ac-source-abbrev
     ac-source-words-in-buffer
     ac-source-files-in-current-dir
     ac-source-filename
     )))

;;; Lisp mode
(dolist (hook (list
               'emacs-lisp-mode-hook
               'lisp-interaction-mode
               ))
  (add-hook hook '(lambda ()
                    (add-to-list 'ac-sources 'ac-source-symbols))))

;; (add-hook 'haskell-mode-hook '(lambda ()
;;                                 (add-to-list 'ac-sources 'ac-source-haskell)))

;; add configs from http://madscientist.jp/~ikegami/diary/20090215.html#p01

;;; emacs-rc-autocomplete.el ends here
