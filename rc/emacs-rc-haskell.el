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

(autoload 'ghc-init "ghc" nil t)

(custom-set-variables
 '(haskell-program-name "ghci")
 '(inferior-haskell-wait-and-jump t)
; '(hs-lint-replace-with-suggestions t)
 )

(defun alexott/haskell-mode-hook ()
  (ghc-init)
  (turn-on-haskell-doc-mode)
  (haskell-indent-mode 1)
;;  (turn-on-haskell-ghci)
  (turn-on-eldoc-mode)
  (haskell-indentation-mode 1)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-cl" 'hs-lint)
  (local-set-key "\C-ch" 'haskell-hoogle)
  (local-set-key "\C-c\C-h" 'haskell-hayoo)
  (setq tab-width 4)
;;  (turn-on-haskell-simple-indent)
  (setq haskell-font-lock-symbols nil)

  (add-to-list 'ac-sources 'ac-source-ghc-mod)
  )
(add-hook 'haskell-mode-hook 'alexott/haskell-mode-hook)

(require 'haskell-interactive-mode)
(defun alexott/hs-interactive-hook ()
  (local-set-key (kbd "C-<up>")
		 '(lambda () (haskell-interactive-mode-history-toggle 1)))
  (local-set-key (kbd "C-<down>")
		 '(lambda () (haskell-interactive-mode-history-toggle -1)))
  )
(add-hook 'haskell-interactive-mode-hook 'alexott/hs-interactive-hook)

;;
(add-to-list 'exec-path "~/.cabal/bin")

;;; emacs-rc-haskell.el ends here
