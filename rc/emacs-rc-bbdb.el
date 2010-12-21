;;; emacs-rc-bbdb.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; Using BBDB
;;(add-to-list 'load-path "~/emacs/bbdb")
;;(require 'bbdb)
(bbdb-initialize 'gnus 'message)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)

(custom-set-variables
 '(bbdb-use-pop-up nil)
 '(bbdb-sounds-directory nil)
 '(news-reply-header-hook nil)
 '(bbdb-offer-save (quote savenoprompt))
 '(bbdb-north-american-phome-numbers-p nil)
 '(bbdb-complete-name-allow-cycling t)
 '(bbdb-quiet-about-name-mismatches t)
 '(bbdb-use-alternate-names nil)
 '(bbdb-extract-address-component-ignore-regexp "noreply-comment@blogger\\.com\\|\\(\\(undisclosed\\|unlisted\\)[^,]*recipients\\)\\|no To-header on input"))


;; complete from bbdb
(defun alexott/bbdb-tab-complete ()
  (interactive)
  (if (mail-abbrev-in-expansion-header-p)
      (bbdb-complete-name)
    (message-tab)))
(define-key message-mode-map [tab] 'alexott/bbdb-tab-complete)

(add-to-list 'file-coding-system-alist (cons "\\.bbdb"  'utf-8))

;;; emacs-rc-bbdb.el ends here
