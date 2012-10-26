;;; emacs-rc-autocomplete.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map (kbd "C-TAB") 'auto-complete)

(defun alexott/ac-hook ()
  (local-set-key [(control return)] 'auto-complete)
  )
(add-hook 'prog-mode-hook 'alexott/ac-hook)
(add-hook 'LaTeX-mode-hook 'alexott/ac-hook)

