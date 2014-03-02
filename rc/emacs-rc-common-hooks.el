;;; emacs-rc-common-hooks.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; common settings for different text & programming modes
(defun alexott/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (font-lock-mode 1)
  )
(add-hook 'prog-mode-hook 'alexott/common-hook)

;; show FIXME/TODO/BUG keywords
(defun alexott/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-string-face t)))
  ;; highlight too long lines
  ;;(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t)))
  )

(defun alexott/common-prog-hook ()
  (subword-mode 1)
  (alexott/show-prog-keywords)
  )
(add-hook 'prog-mode-hook 'alexott/common-prog-hook)

;; clean trailing whitespaces automatically
(setq alexott/trailing-whitespace-modes '(haskell-mode lisp-mode scheme-mode erlang-mode))

(defun alexott/trailing-whitespace-hook ()
  (when (member major-mode alexott/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'alexott/trailing-whitespace-hook)

;; untabify some modes
;; (setq alexott/untabify-modes '(haskell-mode lisp-mode scheme-mode erlang-mode clojure-mode))
;; (defun alexott/untabify-hook ()
;;   (when (member major-mode alexott/untabify-modes)
;;     (untabify (point-min) (point-max))))
;; (add-hook 'before-save-hook 'alexott/untabify-hook)



;;; emacs-rc-common-hooks.el ends here
