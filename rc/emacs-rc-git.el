;;; emacs-rc-git.el ---

;; magit
;(add-to-list 'load-path "~/projects/magit")
(require 'magit)
(require 'magit-svn)
(global-set-key "\C-cm" 'magit-status)
(custom-set-variables
 '(magit-save-some-buffers (quote dontask)))

(add-hook 'magit-mode-hook 'turn-on-magit-svn)

(setq magit-process-connection-type nil)
(setq magit-emacsclient-executable nil)
(setq magit-stage-all-confirm nil)
(setq magit-unstage-all-confirm nil)
(setq magit-restore-window-configuration t)

(define-key magit-mode-map "q" 'bury-buffer)

(custom-set-faces
 '(magit-item-highlight ((t (:background "CadetBlue1"))))
 )



;;; emacs-rc-git.el ends here
