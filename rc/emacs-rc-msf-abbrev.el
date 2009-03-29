;;; emacs-rc-msf-abbrev.el --- 

;; Copyright (C) 2007 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-rc-msf-abbrev.el,v 0.0 2007/09/10 13:27:21 ott Exp $
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet


;; ensure abbrev mode is always on
(setq-default abbrev-mode t)

;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)

;; load up abbrevs for these modes
(require 'msf-abbrev)
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/emacs/msf-abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)


;;; emacs-rc-msf-abbrev.el ends here
