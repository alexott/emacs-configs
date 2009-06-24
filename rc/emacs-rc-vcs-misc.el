;;; emacs-rc-vcs-misc.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; PSVN customization
(custom-set-variables
 '(svn-status-svn-environment-var-list (quote ("LC_MESSAGES=C" "LANG=C" "LC_ALL=C"))))
(autoload 'svn-status "psvn" nil t)

;;; emacs-rc-vcs-misc.el ends here
