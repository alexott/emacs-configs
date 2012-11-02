;;; emacs-rc-css.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

;; TODO: add css-rainbow mode

(defun alexott/css-mode-hook ()
  (rainbow-mode t)
  (set (make-local-variable 'ac-auto-start) 2)
  (set (make-local-variable 'ac-auto-show-menu) t)
  )

(add-hook 'css-mode-hook 'alexott/css-mode-hook)

;;; emacs-rc-css.el ends here
