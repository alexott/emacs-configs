;;; emacs-rc-epg.el ---

;; Copyright (C) 2007 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-rc-epg.el,v 0.0 2007/09/10 13:04:59 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/epg")
(require 'epa-setup)
(setq epa-file-cache-passphrase-for-symmetric-encryption nil)

;;; emacs-rc-epg.el ends here

