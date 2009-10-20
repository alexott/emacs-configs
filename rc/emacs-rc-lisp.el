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


;;; emacs-rc-slime.el ends here
