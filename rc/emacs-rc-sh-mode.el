;;; emacs-rc-sh-mode.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;

(defun sh-check-finish-hook (buf msg)
  "Function, that is executed at the end of sh check"
  (when (not (string-match "finished" msg))
    (next-error 1 t)))

(define-compilation-mode sh-check-mode "SH"
  "Mode for check sh source code."
  (set (make-local-variable 'compilation-disable-input) t)
  (set (make-local-variable 'compilation-scroll-output) nil)
  (set (make-local-variable 'compilation-finish-functions)
       (list 'sh-check-finish-hook))
  )

(defun sh-check-syntax ()
  "Check syntax of current file"
  (interactive)
  (when (string-match "^\\(ba\\|z\\)sh" (symbol-name sh-shell))
    (save-some-buffers t)
    (compilation-start (concat (symbol-name sh-shell) " -n " (buffer-file-name))
                       'sh-check-mode))
  )

;; sh mode hook
(defun my-sh-mode-hook ()
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\C-c\C-c" 'comment-region)
  (local-set-key "\C-u\C-c\C-c" 'comment-region)
  (local-set-key "\C-cl" 'sh-check-syntax)
  )
(add-hook 'sh-mode-hook 'my-sh-mode-hook)

;;; emacs-rc-sh-mode.el ends here
