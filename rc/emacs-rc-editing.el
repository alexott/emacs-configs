;;; emacs-rc-editing.el --- Editing settings

;; Copyright (C) 2007 Alex Ott
;;
;; Author: alexott@gmail.com

(custom-set-variables
 '(delete-selection-mode t)
 '(fill-column 90)
 '(kill-whole-line t)
 '(tab-always-indent t)
 '(indent-tabs-mode nil)
 '(transient-mark-mode t)
 '(tab-width 8)
 '(safe-local-variable-values (quote (
                                      (c-file-offsets (substatement-open . 0))
                                      (prompt-to-byte-compile)
                                      (c-indentation-style . k&r)
                                      (indent-tabs-mode . 1)
                                      (folded-file . t))))
 '(use-dialog-box nil)
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode)))
 '(whitespace-silent t)
 '(show-paren-mode t)
 '(next-line-add-newlines t))

(put 'upcase-region 'disabled nil)

;;; emacs-rc-editing.el ends here
