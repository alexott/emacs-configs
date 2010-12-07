;;; emacs-rc-prolog.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)

(add-hook 'prolog-mode-hook 'alexott/common-hook)
(add-hook 'prolog-mode-hook 'alexott/common-prog-hook)

(add-to-list 'auto-mode-alist '("\\.plg$" . prolog-mode))

;;  (turn-on-eldoc-mode)

;;; emacs-rc-prolog.el ends here
