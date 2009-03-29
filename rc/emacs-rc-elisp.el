;;; emacs-rc-elisp.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun my-elisp-mode-hook ()
;;       (setq tab-width 2)
       (setq indent-tabs-mode t)
       (abbrev-mode 1)
       (auto-fill-mode 1)
       (turn-on-eldoc-mode)
       (local-set-key [return] 'newline-and-indent)
       (local-set-key "\C-m" 'newline-and-indent)
       (local-set-key "\C-c:" 'uncomment-region)
       (local-set-key "\C-c;" 'comment-region)
       (local-set-key [(control c) /] 'semantic-ia-complete-symbol)
       )
(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)

;;; emacs-rc-elisp.el ends here
