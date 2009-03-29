;; -*- mode: lisp; -*-
;; spam splitting with gnus
;; Alex Ott <alexott@gmail.com>

;; Split mail with catch of spam
(setq spam-install-hooks t)
(setq spam-use-stat t)
(require 'spam-stat)
(require 'spam)
;(spam-install-hooks-function)
;; 
(when (file-exists-p spam-stat-file)
  (spam-stat-load))
(setq spam-stat-split-fancy-spam-group "SPAM-new")

(defun my-spam-stat-learn ()
  "Learn about my spam and non-spam"
  (interactive)
  (let ((starting (current-time-string)))
    ;; LEARN SPAM
    (let ((spam-groups '("SPAM-new" "SPAM")))
      (mapc (lambda (x)
	      (spam-stat-process-spam-directory
	       (format "~/Mail/%s" x)))
	    spam-groups))
    
    ;; LEARN HAM
    (let ((ham-groups '("inbox" "openfwtk" "boost-devel" "dg" "emacs-devel" "mzscheme" "dvc")))
      (mapc (lambda (x)
	      (spam-stat-process-non-spam-directory
	       (format "~/Mail/%s" x)))
	    ham-groups))

    ;; TRIM DB and SAVE
    (spam-stat-reduce-size)
    (spam-stat-save)

    ;; PRINT MESSAGE ABOUT ELAPSED TIME
    (message "my-spam-stat-learn:  started at %s, ended at %s"
	     starting (current-time-string))))

