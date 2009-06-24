;;; emacs-rc-lj.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/ljupdate/")
(require 'ljupdate)

(add-hook 'lj-compose-common-hook
          (lambda ()
            (auto-fill-mode nil)
            ))


(custom-set-variables
 '(lj-cache-login-information t)
 '(lj-default-username "alexott")
 )

;;; emacs-rc-lj.el ends here
