;;; emacs-rc-yasnippet.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>

(require 'yasnippet)
(setq yas/snippet-dirs (append '("~/emacs/snippets/") yas/snippet-dirs))
(yas/global-mode 1)
;;(yas/reload-all)

;; hook for automatic reloading of changed snippets
(defun alexott/update-yasnippets-on-save ()
  (when (string-match "/snippets/" buffer-file-name)
;;    (yas/load-snippet-dirs)
    (yas/reload-all)
    ))
(add-hook 'after-save-hook 'alexott/update-yasnippets-on-save)

;;; emacs-rc-yasnippet.el ends here
