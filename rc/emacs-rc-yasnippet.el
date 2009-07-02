;;; emacs-rc-yasnippet.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(setq alexott/yasnippet-dir "~/emacs/yasnippet/snippets")
(yas/load-directory alexott/yasnippet-dir)

;; hook for automatic reloading of changed snippets
(defun alexott/update-yasnippets-on-save ()
  (when (string-match "/yasnippet/snippets" buffer-file-name)
    (yas/load-directory alexott/yasnippet-dir)))
(add-hook 'after-save-hook 'alexott/update-yasnippets-on-save)

;;; emacs-rc-yasnippet.el ends here
