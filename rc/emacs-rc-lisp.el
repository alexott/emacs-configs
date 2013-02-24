;;; emacs-rc-lisp.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun alexott/lisp-mode-hook ()
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  (paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'lisp-mode-hook 'alexott/lisp-mode-hook)

(defun alexott/lisp-interact-mode-hook ()
  (paredit-mode 1)
  )
(add-hook 'lisp-interaction-mode-hook 'alexott/lisp-interact-mode-hook)


;;; emacs-rc-slime.el ends here
