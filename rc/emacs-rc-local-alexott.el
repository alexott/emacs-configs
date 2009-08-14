;;; emacs-rc-local-alexott.el ---

;; erlang
(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(add-to-list 'exec-path "~/exp/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

;;
(require 'sigdb-mode)
(add-hook 'sigdb-mode-hook 'alexott/common-hook)
(add-hook 'sigdb-mode-hook 'alexott/show-prog-keywords)
;; (add-to-list 'hs-special-modes-alist '(sigdb-mode  "^[ \t]+" ";; "))

;; auto-inserts
(add-to-list 'auto-insert-alist '(".*/work/.*\\.cpp$" . ["insert-work.cpp" alexott/auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/work/.*\\.h$"   . ["insert-work.h" alexott/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/work/.*\\.c$" . ["insert-work.cpp" alexott/auto-update-c-source-file]))

;; gnus & mail
(setq nnmail-spool-file '("/var/spool/mail/ott"))

(custom-set-variables
 '(transient-mark-mode t)
 '(compile-command "make -k -j2")
 '(browse-url-browser-function (quote browse-url-firefox))
 )

(set-input-method "russian-computer" nil)

;; decoration
(add-to-list 'default-frame-alist '(font . "Consolas-13"))
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 145))
(add-to-list 'default-frame-alist '(background-color . "grey92"))
(setq initial-frame-alist default-frame-alist)
(setq special-display-frame-alist default-frame-alist)

(custom-set-faces
 '(default ((t (:background "grey90" :foreground "black" :slant normal :weight normal :height 130 :width normal :foundry "microsoft" :family "Consolas"))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :height 1.1))))
 '(font-latex-sectioning-5-face ((((class color) (background light)) (:foreground "blue4" :weight bold))))
 '(font-latex-verbatim-face ((((class color) (background light)) (:foreground "SaddleBrown"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background light)) (:foreground "darkgreen"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "gray40"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background light)) (:foreground "blue4"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "green4"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background light)) (:foreground "blue"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background light)) (:foreground "darkred"))))
 '(jabber-chat-prompt-system ((t (:foreground "darkgreen" :weight bold))))
 '(org-hide ((((background light)) (:foreground "grey90"))))
 '(planner-completed-task-face ((t (:strike-through t)))))

;;; emacs-rc-local-alexott.el ends here
