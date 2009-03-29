;;; emacs-rc-ps-print.el --- 

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

;; BDF fonts for printing
;; (load-library "ps-mule")
;; (setq bdf-directory-list '("/usr/X11R6/lib/X11/fonts/emacs/bdf"))
;; (setq ps-mule-font-info-database-default ps-mule-font-info-database-bdf)
(setq ps-multibyte-buffer 'bdf-font-except-latin)

(defun unicode-cyrillic-to-8859-5 ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((re (format "[%c-%c]+"
		      (decode-char 'ucs #x0400) (decode-char 'ucs #x04ff)))
	  (case-fold-search nil)
	  pos)
      (while (re-search-forward re nil 'move)
	(setq pos (match-beginning 0))
	(encode-coding-region pos (point) 'iso-8859-5)
	(decode-coding-region pos (point) 'iso-8859-5)))))

;;; emacs-rc-ps-print.el ends here
