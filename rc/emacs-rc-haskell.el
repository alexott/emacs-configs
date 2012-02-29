;;; emacs-rc-haskell.el ---

;; Copyright (C) 2008 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-rc-haskell.el,v 0.0 2008/01/28 08:58:32 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


(add-to-list 'load-path "~/projects/haskell-mode")
(load "~/projects/haskell-mode/haskell-site-file.el")

(require 'haskell-checkers)

(add-to-list 'auto-mode-alist '("\\.hsc$" . haskell-mode))

(custom-set-variables
 '(haskell-program-name "ghci")
 '(inferior-haskell-wait-and-jump t)
; '(hs-lint-replace-with-suggestions t)
 )

(defun alexott/haskell-mode-hook ()
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent)
  (turn-on-haskell-ghci)
  (turn-on-eldoc-mode)
  (turn-on-haskell-indentation)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-cl" 'hs-lint)
  (local-set-key "\C-ch" 'haskell-hoogle)
  (local-set-key "\C-c\C-h" 'haskell-hayoo)
  (setq tab-width 4)
;;  (turn-on-haskell-simple-indent)
  (setq haskell-font-lock-symbols t))
(add-hook 'haskell-mode-hook 'alexott/common-hook)
(add-hook 'haskell-mode-hook 'alexott/common-prog-hook)
(add-hook 'haskell-mode-hook 'alexott/haskell-mode-hook)

;;
(add-to-list 'exec-path "~/.cabal/bin")

;;; emacs-rc-haskell.el ends here
