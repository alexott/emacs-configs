;;; emacs-rc-tex.el --- 

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/tex")
(add-to-list 'load-path "~/emacs/auctex")
(add-to-list 'load-path "~/emacs/reftex")

(require 'tex-site)
(setq-default TeX-master nil)
(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq TeX-default-mode 'latex-mode)
(setq TeX-open-quote "``")
(setq TeX-close-quote "''")

(autoload 'turn-on-bib-cite "bib-cite")

(defun My-TeX-keymap ()
  (local-set-key [(meta i)] 
                 '(lambda ()
                    (interactive)
                    (insert "\n\\item "))))

(defun my-texinfo-hook ()
	(local-set-key [delete]  'delete-char)
	(setq delete-key-deletes-forward t))
(add-hook 'texinfo-mode-hook 'my-texinfo-hook)

(defun my-tex-mode-hook ()
	(local-set-key "\\" 'TeX-electric-macro)
	(turn-on-bib-cite)
	(My-TeX-keymap)
	(setq bib-cite-use-reftex-view-crossref t))
(add-hook 'TeX-mode-hook 'my-tex-mode-hook)


(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)


(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode

;; mark some variables as safe
(add-to-list 'safe-local-variable-values '(TeX-open-quote . "<<"))
(add-to-list 'safe-local-variable-values '(TeX-close-quote . ">>"))

;;; emacs-rc-tex.el ends here
