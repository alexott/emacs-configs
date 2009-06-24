;;; emacs-rc-kbd.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; (global-set-key [button5]  'scroll-up)
;; (global-set-key [button4]  'scroll-down)
;; (global-set-key [(kp-7)] 'beginning-of-line)
;; (global-set-key [(kp-8)] 'previous-line)
;; (global-set-key [(kp-9)] 'scroll-down)
;; (global-set-key [(kp-4)] 'backward-char)
;; (global-set-key [(kp-6)] 'forward-char)
;; (global-set-key [(kp-1)] 'end-of-line)
;; (global-set-key [(kp-2)] 'next-line)
;; (global-set-key [(kp-3)] 'scroll-up)
;; (global-set-key [(kp-5)] 'next-line)
;; (global-set-key [(kp-0)] 'overwrite-mode)
;; (global-set-key [(kp-decimal)] 'backward-or-forward-delete-char)
;; (global-set-key [(shift kp-0)] 'yank)
;; (global-set-key [(shift kp-decimal)] 'copy-region-as-kill)
(global-set-key [help] 'info)
(global-set-key [f5] 'delete-other-windows)
(global-set-key [f6] 'other-window)
;; (global-set-key [f6] 'bury-buffer)
(global-set-key [f7] 'replace-string)
(global-set-key [f8] 'next-error)
(global-set-key [f10] 'delete-frame)
;; (global-set-key "\M-0" 'buffer-menu)
;; (global-set-key [(control menu)] 'popup-mode-menu)
(global-set-key [(shift insert)] 'clipboard-yank)
(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(control x) r j] 'bookmark-jump)

;; (global-set-key [(control tab)] `other-window)
;; (defun switch-to-other-buffer () (interactive) (switch-to-buffer (other-buffer)))
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(meta g)] 'goto-line)

;; popup menus
(global-set-key [(mouse-3)] 'mouse-major-mode-menu)
;; (global-set-key [(shift mouse-3)] 'mouse-buffer-menu)

;;; emacs-rc-kbd.el ends here
