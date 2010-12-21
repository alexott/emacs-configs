;;; emacs-rc-erlang.el ---

;; Copyright (C) 2008 Alex Ott
;;
;; Author: alexott@gmail.com

;;(add-to-list 'load-path "~/emacs/erlware-mode")
;(require 'erlang-start)

;;(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
;;(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

;(add-to-list 'load-path "~/emacs/distel/elisp")
;(require 'distel)
;(distel-setup)

;; flymake for erlang
(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name temp-file
                                         (file-name-directory buffer-file-name))))
    (list "~/emacs/bin/eflymake" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.erl\\'" flymake-erlang-init))

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
(add-hook 'erlang-mode-hook 'alexott/common-hook)
(add-hook 'erlang-mode-hook 'alexott/common-prog-hook)

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

;;(add-to-list 'load-path "~/emacs/esense")
;;(require 'esense-start)
;;(setq esense-indexer-program "~/emacs/esense/esense.sh")


;;; emacs-rc-erlang.el ends here
