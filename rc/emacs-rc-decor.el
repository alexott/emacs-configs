;;; emacs-rc-decor.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'tree-widget)

(load-library "time")
(setq display-time-24hr-format t
      display-time-mail-file t
      display-time-form-list (list 'time 'load)
      display-time-day-and-date t)
(display-time)
(blink-cursor-mode t)

;;
(require 'mwheel)
(mwheel-install)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; set misc decoration variables
(custom-set-variables
 '(global-font-lock-mode t)
 '(scalable-fonts-allowed t)
 '(uniquify-buffer-name-style (quote forward))
 '(use-dialog-box nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(custom-buffer-done-kill t)
 '(initial-scratch-message nil)
 '(transient-mark-mode t))

;;; emacs-rc-decor.el ends here
