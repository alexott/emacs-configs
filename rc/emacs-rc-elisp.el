;;; emacs-rc-elisp.el --- Settings for Emacs Lisp editing

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun alexott/elisp-mode-hook ()
  (setq indent-tabs-mode t)
  (abbrev-mode 1)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  (paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-cf" 'find-function)
  (local-set-key "\C-c4f" 'find-function-other-window)
  (local-set-key "\C-c5f" 'find-function-other-frame)
  (local-set-key "\C-ck" 'find-function-on-key)
  (local-set-key [(control c) /] 'semantic-ia-complete-symbol)
  )
(add-hook 'emacs-lisp-mode-hook 'alexott/elisp-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/common-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/common-prog-hook)

;;
;; (add-to-list 'auto-mode-alist '("\\.el" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.gnus$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs$" . emacs-lisp-mode))


;;; emacs-rc-elisp.el ends here
