;;; emacs-rc-lisp.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun alexott/lisp-mode-hook ()
  ;;       (setq tab-width 4)
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'lisp-mode-hook 'alexott/lisp-mode-hook)
(add-hook 'lisp-mode-hook 'alexott/common-hook)
(add-hook 'lisp-mode-hook 'alexott/show-prog-keywords)

;; lookup information in hyperspec
(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))

;;; SLIME
(require 'inf-lisp)
(setq inferior-lisp-program "sbcl")
(setq slime-net-coding-system 'utf-8-unix)
(push "~/emacs/slime/" load-path)
(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook
          (lambda ()
            (slime-mode t)))

(add-hook 'inferior-lisp-mode-hook
          (lambda ()
            (inferior-slime-mode t)))

(add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))
(add-hook 'slime-connected-hook 'slime-ensure-typeout-frame)

(eval-after-load "slime"
  '(progn
     (push "~/emacs/slime/contrib" load-path)
     (slime-setup '(slime-fancy slime-asdf slime-banner slime-fuzzy slime-autodoc slime-repl))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
     ))

;;; emacs-rc-slime.el ends here
