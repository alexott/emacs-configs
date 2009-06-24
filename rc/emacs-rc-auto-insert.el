;;; emacs-rc-auto-insert.el ---

;; Copyright (C) 2008 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-rc-auto-insert.el,v 0.0 2008/03/10 14:12:35 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; auto-insert stuff
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory (concat (getenv "HOME") "/emacs/auto-insert/"))
(setq auto-insert 'other)
(setq auto-insert-query nil)

(setq auto-insert-alist '(("\\.muse$" . ["insert.muse"])
                          ("\\.sh$" . ["insert.sh" alexott/auto-update-defaults])
                          ("\\.lisp$" . ["insert.lisp" alexott/auto-update-defaults])
                          ("\\.el$" . ["insert.el" alexott/auto-update-defaults])
                          ("\\.erl$" . ["insert.erl" alexott/auto-update-defaults])
                          ))
(add-to-list 'auto-insert-alist '(".*/projects/.*\\.cpp$" . ["insert-home.cpp" alexott/auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/projects/.*\\.h$"   . ["insert-home.h" alexott/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/projects/.*\\.hpp$"   . ["insert-home.h" alexott/auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/projects/.*\\.c$" . ["insert-home.cpp" alexott/auto-update-c-source-file]))

(defun alexott/auto-replace-header-name ()
  (save-excursion
    (while (search-forward "###" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (upcase (file-name-nondirectory buffer-file-name)))
        (subst-char-in-region (point-min) (point-max) ?. ?_)
        (subst-char-in-region (point-min) (point-max) ?- ?_)
        ))
    )
  )

(defun alexott/auto-replace-file-name ()
  (save-excursion
    ;; Replace @@@ with file name
    (while (search-forward "(>>FILE<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-nondirectory buffer-file-name) t)
        ))
    )
  )

(defun alexott/auto-replace-file-name-no-ext ()
  (save-excursion
    ;; Replace @@@ with file name
    (while (search-forward "(>>FILE_NO_EXT<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (file-name-sans-extension (file-name-nondirectory buffer-file-name)) t)
        ))
    )
  )

(defun alexott/insert-today ()
  "Insert today's date into buffer"
  (interactive)
  (insert (format-time-string "%A, %B %e %Y" (current-time))))

(defun alexott/auto-replace-date-time ()
  (save-excursion
    ;; replace DDDD with today's date
    (while (search-forward "(>>DATE<<)" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match "" t)
        (alexott/insert-today)
        ))))

(defun alexott/auto-update-header-file ()
  (alexott/auto-replace-header-name)
  (alexott/auto-replace-file-name)
  )

(defun alexott/auto-update-c-source-file ()
  (save-excursion
    ;; Replace HHHH with file name sans suffix
    (while (search-forward "HHHH" nil t)
      (save-restriction
        (narrow-to-region (match-beginning 0) (match-end 0))
        (replace-match (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".h") t))))
  (alexott/auto-replace-file-name)
  (alexott/auto-replace-date-time))

(defun alexott/auto-update-defaults ()
  (alexott/auto-replace-file-name)
  (alexott/auto-replace-file-name-no-ext)
  (alexott/auto-replace-date-time)
  )

;;; emacs-rc-auto-insert.el ends here
