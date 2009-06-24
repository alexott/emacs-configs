;;; emacs-rc-supercite.el --- Settings for supercite library

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


;; Setting up Supercite library
(autoload 'sc-cite-original "supercite" nil t)
;; (load-library "supercite")

(setq sc-confirm-always-p nil
      sc-nested-citation-p t
      sc-preferred-header-style 4
      )


(defun Ran:citation-line ()
  (insert "\n\n")
  (insert (SNP:email->stripped-full-name (mail-header-from message-reply-headers)))
  (insert "  at \"" (mail-header-date message-reply-headers) "\" wrote:\n"))

(setq message-citation-line-function 'Ran:citation-line)

(defun Ran:citation ()
  (let ((beg (point))
        (end (mark t))
        (initials (SNP:full-name->initials
                   (SNP:email->stripped-full-name
                    (message-fetch-reply-field "From")))))
    (save-excursion
      (narrow-to-region beg end)
      ;; delete headers
      (goto-char (point-min))
      (search-forward "\n\n")
      (delete-region (point-min) (point))

      (while (and (point-min)
                  (eolp)
                  (not (eobp)))
        (message-delete-line))

      (when (search-forward-regexp "^-- ?$" (point-max) t)
        (delete-region (match-beginning 0) (point-max)))

      (goto-char beg)
      (while (not (eobp))
        (beginning-of-line)
        (unless (eolp)
          (if (re-search-forward "^ *\\(\\w*\\)\\(>\\)" (point-at-eol)
                                 t)
              (replace-match " \\1>\\2")
            (insert " " initials "> ")))
        (forward-line 1))
      (widen)
      (insert "\n"))))

(setq mail-citation-hook
      '(lambda ()
         (Ran:citation)
         (let ((p (point)))
           (Ran:citation-line)
           (goto-char p))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Разные полезные функции из gnus-snp
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;
;; Удалить пробелы в начале и в конце строки
;;
(defun SNP:strip-string (str)
  (let ((s str))
    (when (string-match "^[ \"]+" s)
      (setq s (substring s (match-end 0))))
    (when (string-match "[ \"]+$" s)
      (setq s (substring s 0 (match-beginning 0))))
    (symbol-value 's)))

;;
;; Получить имя из e-mail'а
;;
(defun SNP:email->full-name (from)
  (if from
      (let ((s))
        (if (cdr (setq s (split-string from "<\\|>")))
            (car s)
          (if (cdr (setq s (split-string from "\(\\|\)")))
              (cadr s)
            from)))
    ""))

(defun SNP:email->stripped-full-name (from)
  (SNP:strip-string (SNP:email->full-name from)))

;;
;; Получить начало имени из полного имени
;;
(defun SNP:full-name->first-name (name)
  (when (string-match "[^ ]*" name)
    (substring name (match-beginning 0) (match-end 0))))

;;
;; Получить инициалы из имени
;;
(defun SNP:full-name->initials (name)
  (let ((lst (split-string name " +"))
        (out ""))
    (while lst
      (setq out (concat out (char-to-string (car (string-to-list (car lst))))))
      (setq lst (cdr lst))
      )
    (symbol-value 'out)))

;;
;; Разрыв строки, сохраняющий квотинг
;;
(defun Ran:break-cited-line ()
  (interactive)
  (if (or (bolp) (eolp))
      (insert "\n")
    (let ((quote-string nil))
      (save-excursion
        (beginning-of-line)
        (when (re-search-forward "^ *\\w*>+" (point-at-eol) t)
          (setq quote-string (match-string 0))))
      (if quote-string
          (insert (concat "\n" quote-string))
        (insert "\n")))))


;;; emacs-rc-supercite.el ends here
