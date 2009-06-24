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

;; dokuwiki
(global-unset-key [(control v)])
(require 'dokuwiki)
(add-to-list 'auto-mode-alist '("\\.doku?$" . simple-dokuwiki-mode))
(add-hook 'simple-dokuwiki-mode-hook 'turn-on-flyspell)
(custom-set-faces
 '(simple-wiki-teletype-face ((((class color) (background light)) (:underline "darkgreen")))))



;;; emacs-rc-wikis.el ends here
