;;; emacs-rc-autocomplete.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


(add-to-list 'load-path "~/emacs/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/emacs/auto-complete/ac-dict")
(ac-config-default)

;; Generic setup.
(setq ac-auto-start t)                ;automatically start (disabled)
(setq ac-dwim t)                        ;Do what i mean
;;(ac-set-trigger-key "M-TAB")
;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;; emacs-rc-autocomplete.el ends here
