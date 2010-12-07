;;; emacs-rc-python.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(defun alexott/python-mode-hook ()
;;  (setq tab-width 2)
  (local-set-key [return] 'newline-and-indent)
  (setq indent-tabs-mode t)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)

  (define-key python-mode-map "\"" 'electric-pair)
  (define-key python-mode-map "\'" 'electric-pair)
  (define-key python-mode-map "(" 'electric-pair)
  (define-key python-mode-map "[" 'electric-pair)
  (define-key python-mode-map "{" 'electric-pair)
  )
(add-hook 'python-mode-hook 'alexott/python-mode-hook)
(add-hook 'python-mode-hook 'alexott/common-hook)
(add-hook 'python-mode-hook 'alexott/common-prog-hook)

(add-hook 'python-mode-hook 'flyspell-prog-mode)

;;; emacs-rc-python.el ends here
