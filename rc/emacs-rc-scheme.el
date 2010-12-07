;;; emacs-rc-scheme.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme" t)
(setq scheme-program-name "mzscheme")

(require 'quack)
(setq quack-remap-find-file-bindings-p nil)

(defun insert-balanced-comments (arg)
  "Insert a set of balanced comments around the s-expression
containing the point.  If this command is invoked repeatedly
(without any other command occurring between invocations), the
comment progressively moves outward over enclosing expressions."
  (interactive "*p")
  (save-excursion
    (when (eq last-command this-command)
      (when (search-backward "#|" nil t)
        (save-excursion
          (delete-char 2)
          (while (and (< (point) (point-max)) (not (looking-at " *|#")))
            (forward-sexp))
          (replace-match ""))))
    (while (> arg 0)
      (backward-char 1)
      (cond ((looking-at ")") (incf arg))
            ((looking-at "(") (decf arg))))
    (insert "#|")
    (forward-sexp)
    (insert "|#")))

(defun remove-balanced-comments ()
  "Remove a set of balanced comments enclosing point."
  (interactive "*")
  (save-excursion
    (when (search-backward "#|" nil t)
      (delete-char 2)
      (while (and (< (point) (point-max)) (not (looking-at " *|#")))
        (forward-sexp))
      (replace-match ""))))

(add-hook 'inferior-scheme-mode-hook
          '(lambda ()
             (split-window)))

(defun r5rs-call ()
  "Calls r5rs info for current symbol"
  (interactive)
  (ignore-errors
    (let ((symbol (thing-at-point 'symbol)))
      (info "(r5rs)")
      (Info-index symbol))))

(defun alexott/scheme-mode-hook ()
  "My customization of Scheme Mode"
  (turn-on-eldoc-mode)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key [f1] 'r5rs-call)
  (paredit-mode +1)
)

(add-hook 'scheme-mode-hook 'alexott/scheme-mode-hook)
(add-hook 'scheme-mode-hook 'alexott/common-hook)
(add-hook 'scheme-mode-hook 'alexott/common-prog-hook)

(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))

;; (add-to-list 'load-path "~/emacs/geiser")
;; (require 'geiser-install)
;; (setq geiser-impl-installed-implementations '(plt guile))
;; (setq geiser-impl-default-implementation 'plt)

;;; emacs-rc-scheme.el ends here
