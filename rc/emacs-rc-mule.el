;;; emacs-rc-mule.el ---

;; Copyright (C) 2005 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; (set-language-environment 'Cyrillic-KOI8)
;; (set-selection-coding-system 'cyrillic-koi8)

(custom-set-variables
 '(current-language-environment "UTF-8")
 '(default-input-method "russian-computer")
 '(x-select-enable-clipboard t)
;; '(interprogram-paste-function (quote x-clipboard-yank))
)

(set-input-method "russian-computer" nil)
(setenv "LANG" "ru_RU.UTF-8")

(define-coding-system-alias 'koi8-ru 'koi8-u)
(define-coding-system-alias 'koi8-r 'koi8-u)

;;; emacs-rc-mule.el ends here
