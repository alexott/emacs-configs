;;; emacs-rc-javascript.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;(load-library "js2-mode")
(autoload 'js2-mode "js2-mode" nil t)
(setq js2-use-font-lock-faces t)
(setq js2-indent-on-enter-key t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-use-font-lock-faces t)

(defun alexott/js2-mode-hook ()
  (local-set-key [return] 'newline-and-indent)
  (set (make-local-variable 'ac-auto-start) 3)
  (set (make-local-variable 'ac-auto-show-menu) t)
  )
(add-hook 'js2-mode-hook 'alexott/js2-mode-hook)

;;; emacs-rc-javascript.el ends here
