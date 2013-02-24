;;; emacs-rc-erlang.el ---

;; Copyright (C) 2008 Alex Ott
;;
;; Author: alexott@gmail.com

(add-to-list 'load-path "~/emacs/erlang-mode")
(require 'erlang-start)
(require 'erlang-flymake)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(defun alexott/erlang-mode-hook ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add Erlang functions to an imenu menu
  (imenu-add-to-menubar "imenu")
  (when (and buffer-file-name
             (string-match "flymake" buffer-file-name))
    (flymake-mode -1))
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'erlang-mode-hook 'alexott/erlang-mode-hook)

(eval-after-load "erlang-skels"
  (progn
    (setq erlang-skel-mail-address "alexott@gmail.com")))

(when (locate-library "distel")
  (require 'distel)
  (distel-setup))

(setq alexott/wrangler-path (file-name-as-directory (expand-file-name "~/projects/wrangler")))
(when (file-exists-p alexott/wrangler-path)
  (add-to-list 'load-path (concat alexott/wrangler-path "elisp"))
  (require 'wrangler)
  )

(defun alexott/get-erlang-app-dir ()
  (let* ((src-path (file-name-directory (buffer-file-name)))
	 (pos (string-match "/src/" src-path)))
    (if pos
	(substring src-path 0 (+ 1 pos))
      src-path)))

;; (setq erlang-flymake-get-code-path-dirs-function
;;       (lambda ()
;; 	(concat (alexott/get-erlang-app-dir) "ebin")))

;; (setq erlang-flymake-get-code-include-dirs-function
;;       (lambda ()
;; 	(concat (alexott/get-erlang-app-dir) "include")))

;;; emacs-rc-erlang.el ends here
