;;; emacs-rc-diary.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(autoload 'todo-mode "todo-mode" "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode" "Show TODO items." t)
(autoload 'todo-insert-item "todo-mode" "Add TODO item." t)
(global-set-key "\C-ct" 'todo-show) ;; switch to TODO buffer
(global-set-key "\C-ci" 'todo-insert-item) ;; insert new item
(setq todo-file-do "~/emacs/.todo-do")
(setq todo-file-done "~/emacs/.todo-done")
(setq todo-file-top "~/emacs/.todo-top")

;;; emacs-rc-diary.el ends here
