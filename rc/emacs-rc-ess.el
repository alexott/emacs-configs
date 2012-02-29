;;; emacs-rc-ess.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; R doc
(add-to-list 'auto-mode-alist '("\\.r\\'" . ess-mode))

(defun alexott/ess-mode-hook ()
  (local-set-key [(control return)] 'ess-eval-line-and-step)
  (font-lock-mode 1)
  )
(add-hook 'ess-mode-hook 'alexott/ess-mode-hook)

;; Rd-mode...
(add-to-list 'auto-mode-alist '("\\.rd\\'" . Rd-mode))
(defun alexott/rd-mode-hook ()
  (abbrev-mode 1)
  (font-lock-mode 1)
  )
(add-hook 'Rd-mode-hook 'alexott/rd-mode-hook)

;;; emacs-rc-ess.el ends here
