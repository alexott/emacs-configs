;;; emacs-rc-git.el ---

;; standard git module
(require 'git)

;; git-emacs
;; (require 'git-emacs)

;; magit
;(add-to-list 'load-path "~/projects/magit")
(require 'magit)
(require 'magit-svn)
(global-set-key "\C-cm" 'magit-status)
(custom-set-variables
 '(magit-save-some-buffers (quote dontask)))

(setq magit-process-connection-type nil)

;;; emacs-rc-git.el ends here
