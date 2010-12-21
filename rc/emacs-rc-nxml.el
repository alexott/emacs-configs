;;; emacs-rc-nxml.el --- customisation of nXML-mode

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; NXML mode

(defun alexott/nxml-mode-hook ()
  (local-set-key "\C-c/" 'nxml-finish-element)
  (auto-fill-mode)
  (rng-validate-mode)
  (unify-8859-on-decoding-mode)
  (setq ispell-skip-html t)
  (hs-minor-mode 1)
  )
(add-hook 'nxml-mode-hook 'alexott/nxml-mode-hook)
(add-hook 'nxml-mode-hook 'alexott/common-hook)

(add-to-list
 'auto-mode-alist
 (cons (concat "\\."
               (regexp-opt
                '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "rdf") t) "\\'")
       'nxml-mode))
(push '("<\\?xml" . nxml-mode) magic-mode-alist)

;; (add-to-list 'load-path "~/emacs/docbook-menu")
;; (require 'docbk-menu)
;; (add-hook 'nxml-mode-hook 'docbook-menu-mode)

(custom-set-variables
 '(nxml-auto-insert-xml-declaration-flag nil)
 '(nxml-attribute-indent 2)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "\\|<[^/>]&>\\|<[^/][^>]*[^/]>"
               ""
               nil))

;;; emacs-nxml.el ends here
