;;; emacs-rc-go.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(when (file-exists-p "~/exp/go/src/github.com/nsf/gocode/emacs/")
  (load "~/exp/go/src/github.com/nsf/gocode/emacs/go-autocomplete.el"))

(defun alexott/go-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  ;; minor modes
  (auto-fill-mode 0)  
  ;; local keys
  (local-set-key [return] 'newline-and-indent)

  ;; autocomplete
  (set (make-local-variable 'ac-auto-start) 3)
  (set (make-local-variable 'ac-auto-show-menu) 0.5)
  
  )
(add-hook 'go-mode-hook 'alexott/go-mode-hook)


;;; emacs-rc-go.el ends here
