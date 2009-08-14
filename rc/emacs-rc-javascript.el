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

(add-to-list 'load-path "~/emacs/ejacs")
(autoload 'js-console "js-console" nil t)

;;; emacs-rc-javascript.el ends here
