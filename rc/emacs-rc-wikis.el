;;; emacs-rc-wikis.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; moin-moin editing
(require 'moinmoin-mode)
(add-hook 'outline-mode-hook 'turn-on-flyspell)
;;(defun alexott/outline-mode-hook ()
;;   (longlines-mode +1)
;;  )
;;(add-hook 'outline-mode-hook 'alexott/outline-mode-hook)

;; dokuwiki
(global-unset-key [(control v)])
(require 'dokuwiki)
(add-to-list 'auto-mode-alist '("\\.doku?$" . simple-dokuwiki-mode))
(add-hook 'simple-dokuwiki-mode-hook 'turn-on-flyspell)
(custom-set-faces
 '(simple-wiki-teletype-face ((((class color) (background light)) (:underline "darkgreen")))))

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.te?xt$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown?$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


;;; emacs-rc-wikis.el ends here
