;;; emacs-rc-desktop.el --- Load desktop settings

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(setq-default desktop-missing-file-warning nil)
(setq-default desktop-path (quote ("~")))
(setq-default desktop-save t)
(setq-default desktop-save-mode t)
(setq-default save-place t)

;;(when (fboundp 'desktop-load-default)
;;   (desktop-load-default)
;; (mapcar
;;  (lambda (symbol) 
;; 	 (add-to-list 'desktop-globals-to-save symbol))
;;  '((buffer-name-history      . 100)
;; 	 (dired-regexp-history     . 20)
;; 	 (extended-command-history . 100)
;; 	 (file-name-history        . 500)
;; 	 (grep-history             . 50)
;; 	 (minibuffer-history       . 100)
;; 	 (query-replace-history    . 60)
;; 	 (read-expression-history  . 60)
;; 	 (regexp-history           . 60)
;; 	 (regexp-search-ring       . 20)
;; 	 (search-ring              . 20)
;; 	 (shell-command-history    . 50)))
;;;    (desktop-read)
;;	 )

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)

(defun my-desktop-ignore-semantic (desktop-buffer-file-name)
       "Function to ignore cedet minor modes during restore of buffers"
       nil)
(add-to-list 'desktop-minor-mode-handlers '(semantic-stickyfunc-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(senator-minor-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-scheduler-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-summary-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-completions-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-mru-bookmark-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-decoration-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(srecode-minor-mode . my-desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(ede-minor-mode . my-desktop-ignore-semantic))

(desktop-read)

;;; emacs-rc-desktop.el ends here
