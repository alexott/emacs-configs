;;; emacs-rc-bbdb.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

;; Using BBDB
(add-to-list 'load-path "~/emacs/bbdb")
(require 'bbdb)
(bbdb-initialize 'gnus 'message)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)

(setq bbdb-use-pop-up nil)
(setq bbdb-sounds-directory nil) 
(setq news-reply-header-hook nil)
(setq bbdb-offer-save (quote savenoprompt))
(setq bbdb-north-american-phome-numbers-p nil)
(setq bbdb-complete-name-allow-cycling t)
(setq bbdb-quiet-about-name-mismatches t)
(setq bbdb-use-alternate-names nil)

;; complete from bbdb
(defun my-bbdb-tab-complete ()
	(interactive)
	(if (mail-abbrev-in-expansion-header-p)
			(bbdb-complete-name)
		(message-tab)))
(define-key message-mode-map [tab] 'my-bbdb-tab-complete)

;;; emacs-rc-bbdb.el ends here
