;;; emacs-rc-ccmode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'cc-mode)
(require 'imenu)

;; customisation of cc-mode
(defun my-c-mode-common-hook ()
        ;; style customization
        (c-set-offset 'member-init-intro '++)
        (setq tab-width 4)
        (setq   indent-tabs-mode t)
        (c-set-offset 'substatement-open 0)
        (c-set-style "bsd")
        (setq c-basic-offset 4)
        (c-toggle-auto-hungry-state 0)
        ;; minor modes
        (auto-fill-mode 1)
        (turn-on-eldoc-mode)
        (gtags-mode 1)
        (hs-minor-mode 1)
        ;; local keys
        (local-set-key [delete]  'delete-char)
        (local-set-key [return] 'newline-and-indent)
        (local-set-key "\C-m" 'newline-and-indent)
        (local-set-key "\C-c:" 'uncomment-region)
        (local-set-key "\C-c;" 'comment-region)
;;      (company-mode 1)
        ;; highlight additional keywords
        (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
        ;; highlight too long lines
        (font-lock-add-keywords nil '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))
        ;; show trailing whitespace
        ;; (setq show-trailing-whitespace t)
        )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(require 'info-look)
(info-lookup-add-help
 :mode 'c-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(libc)Symbol Index" nil nil nil)))

(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(add-hook 'c-mode-hook 'fp-c-mode-routine)

;;
(autoload 'rebox-comment "rebox" nil t)
(autoload 'rebox-region "rebox" nil t)

(setq-default c-default-style (quote ((java-mode . "java") (other . "gnu"))))

(add-to-list 'auto-mode-alist '("\\.ipp?$" . c++-mode))

;;; emacs-rc-cmode.el ends here
