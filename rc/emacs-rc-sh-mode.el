;;; emacs-rc-sh-mode.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;

(defun alexott/sh-check-finish-hook (buf msg)
  "Function, that is executed at the end of sh check"
  (when (not (string-match "finished" msg))
    (next-error 1 t)))

(define-compilation-mode sh-check-mode "SH"
  "Mode for check sh source code."
  (set (make-local-variable 'compilation-disable-input) t)
  (set (make-local-variable 'compilation-scroll-output) nil)
  (set (make-local-variable 'compilation-finish-functions)
       (list 'alexott/sh-check-finish-hook))
  )

(defun alexott/sh-check-syntax ()
  "Check syntax of current file"
  (interactive)
  (when (string-match "^\\(ba\\|z\\)sh" (symbol-name sh-shell))
    (save-some-buffers t)
    (compilation-start (concat (symbol-name sh-shell) " -n " (buffer-file-name))
                       'sh-check-mode))
  )

;; sh mode hook
(defun alexott/sh-mode-hook ()
  (local-set-key "\C-cl" 'alexott/sh-check-syntax)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'sh-mode-hook 'alexott/sh-mode-hook)
(add-hook 'sh-mode-hook 'alexott/common-hook)
(add-hook 'sh-mode-hook 'alexott/common-prog-hook)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; emacs-rc-sh-mode.el ends here
