;;; emacs-rc-gnus.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


;; mail settings
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t
      starttls-use-gnutls t)
(require 'starttls)
(require 'smtpmail)

(setq gnus-ignored-newsgroups "")

;; Gnus Mail setup
(setq gnus-secondary-select-methods '(
                                      (nnimap "gmail"
                                              (nnimap-address "imap.gmail.com")
                                              (nnimap-server-port 993)
                                              (nnimap-stream ssl)
                                              (nnimap-expunge-on-close always)
                                              )
                                      (nnml "")
                                      )
      )

(setq gnus-parameters
      '(
        ("^nntp.*"
         (gnus-fetch-old-headers t)
         )
        ("^nnimap.*"
         (gnus-fetch-old-headers t)
         )
        ))

(setq gnus-posting-styles
      '(
        (".*"
         (Gcc "nnml:sent")
         (Organization "Alex Ott's Consulting")
         (signature-file "~/.signature")
         )
        ))


;; automatic import of ical notice
(add-hook 'gnus-article-prepare-hook 'icalendar-import-buffer)

;; Old Customization
;; ============================================================
(add-hook 'mime/editor-mode-hook
          '(lambda ()
             (put-alist 'koi8-r nil
                        mime-editor/charset-default-encoding-alist)
             (put-alist "Subject" nil mime/field-encoding-method-alist)
             (put-alist "To" nil mime/field-encoding-method-alist)
             ))

(add-hook 'gnus-article-display-hook
          '(lambda ()
             (gnus-article-highlight)
             (gnus-article-hide-headers-if-wanted)
             (setq gnus-visible-headers
                   '("^From:" "^X-Comment-To:" "^Comment-To:" "^Subject:" "^Date:"
                     "^Followup-To:" "^Reply-To:" "^Organization:" "^Summary:"
                     "^Keywords:" "^To:" "^Cc:" "^Posted-To:" "^Mail-Copies-To:"
                     "^Apparently-To:" "^Gnus-Warning:" "^Resent-From" "^Bcc:" ))
             (article-emphasize)
             )
          )

(add-hook 'gnus-summary-mode-hook
          '(lambda ()
             (local-set-key [tab] 'gnus-summary-next-unread-article)
             (save-excursion
               (goto-char (point-min))
               )
             )
          )

(setq gnus-add-to-list t
      gnus-inhibit-startup-message t
      gnus-read-active-file nil
      gnus-check-new-newsgroups 'ask-server
      gnus-use-sc t
      gnus-select-method '(nnnil "")
      mail-signature t
      default-mime-charset 'koi8-r
      message-default-charset 'koi8-r
      gnus-strict-mime t
      mime-editor/transfer-level 8
      mime-editor/transfer-level-string "8bit"
      gnus-novice-user nil
      gnus-auto-select-next nil
      gnus-cite-minimum-match-count 1
      )


(load-library "supercite")

(setq sc-preferred-attribution-list
      '( "initials" "x-attribution" "firstname" "sc-lastchoice" )
      sc-rewrite-header-list '((my-header-line-generator))
      sc-preferred-header-style 0
      sc-citation-leader " "
      sc-citation-separator " "
      sc-citation-delimiter ">"
      sc-citation-nonnested-root-regexp "[-._a-zA-Z0-9ÁÂ×ÇÄÅÖÚÉÊËÌÍÎÏÐÒÓÔÕÆÈÃÞÛÝØÙßÜÀÑáâ÷çäåöúéêëìíîïðòóôõæèãþûýøùÿüàñ]*"
      sc-citation-delimetr-regexp "[>:]+"
      sc-confirm-always-p nil
;;      sc-auto-fill-region-p t
      sc-fixup-whitespace-p nil
      )

;;; sc hack by Bor.
(defun sc-add-citation-level-m ()
  "Add citation level to cited string"
  (interactive)
  (if (looking-at (sc-cite-regexp))
      (if (re-search-forward
           (concat sc-citation-leader-regexp sc-citation-root-regexp)
           )
          (insert sc-citation-delimiter)
        )
    (sc-cite-line)
    )
  )

                                        ;
(defun my-header-line-generator ()
  (let ((sc-mumble "")
        (whofrom (sc-whofrom)))
    (if whofrom
        (insert sc-reference-tag-string
                (sc-hdr "\"" (sc-mail-field "sc-attribution") "\" == ")
                (sc-hdr ""   (sc-mail-field "sc-author") " ")
                "writes:"))))

(setq rfc2047-header-encoding-alist
      '(("Newsgroups"  . nil)
        ("Message-ID"  . nil)
        ("Subject"     . mime)
        ("From"     . default)
        ("To"     . default)
        (t             . mime)))

(setq mm-body-charset-encoding-alist
      '((windows-1251 . 8bit)
        (koi8-r . 8bit)))

(require 'gnus-setup)

(setq news-reply-header-hook nil)

(require 'gnus-art)
(require 'gnus-cite)

(defun sc-break-cited-line ()
  "Break cited line. Do it correctly."
  (interactive)
  (delete-horizontal-space)
  (newline)
  (forward-line -1)
  (let ((cited (looking-at (sc-cite-regexp))))
    (forward-line)
    (if cited (progn (sc-cite-line) (just-one-space)))))

(defun sc-header-hello-attributed-writes ()
  "Insert Hi, sc-firstneme, then sc-header-attributed-writes"
  (insert
   (concat "Hello, " (sc-mail-field "sc-firstname") "!\n\n"))
  (sc-header-attributed-writes))

(defun sc-install-rewrite-header-fn (new-fn)
  "Install new header rewrite function and make it preffered"
  (setq sc-preferred-header-style (length sc-rewrite-header-list))
  (setq sc-rewrite-header-list
        (append sc-rewrite-header-list `((,new-fn)))))

(defun ic-cite-message ()
  (sc-cite-original)
  (local-set-key "\C-m" 'sc-break-cited-line))

(add-hook 'sc-load-hook (lambda ()
                          (sc-install-rewrite-header-fn
                           'sc-header-hello-attributed-writes)
                          (setq sc-confirm-always-p nil)))

(defun SNP:citation-line ()
  (let* ((email-from (mail-header-from message-reply-headers))
         (name-from (SNP:email->stripped-full-name email-from))
         (name-to (message-fetch-reply-field "X-Comment-To")))
                                        ;    (insert "Hello " (SNP:full-name->first-name name-from) ".\n\n")
    (insert "## On " (mail-header-date message-reply-headers) "\n")
    (if (string-match "^To: " (buffer-string))
        (insert "## you wrote:\n\n")
      (progn
        (insert "## " name-from)

        ;; Insert FTN address
        (let ((ftnaddr (SNP:email->ftn-addr email-from)))
          (when ftnaddr
            (insert " (" ftnaddr ")")))

        (insert " wrote")

        ;; Insert X-Comment-To
        (when name-to
          (insert " to ")
          (let ((to (SNP:email->stripped-full-name name-to)))
            (if (SNP:my-name-p to)
                (insert "me")
              (insert to))))

        (insert ":\n\n")))))

(setq message-citation-line-function 'SNP:citation-line)

;; Based on code by Sergey Dolin <dsa-ugur@chel.surnet.ru>
;; and message-indent-citation function of Gnus
(defun SNP:citation ()
  (let ((beg (point))
        (end (mark t))
        (initials (SNP:full-name->initials
                   (SNP:email->stripped-full-name
                    (message-fetch-reply-field "From")))))
    (save-excursion
      (narrow-to-region beg end)
      (goto-char (point-min))
      (search-forward "\n\n")
      (delete-region (point-min) (point))
      (while (and (point-min)
                  (eolp)
                  (not (eobp)))
        (message-delete-line))

      ;; ... É × ËÏÎÃÅ ÔÅËÓÔÁ
      (goto-char (point-max))
      (unless (eolp)
        (insert "\n"))
      (while (and (zerop (forward-line -1))
                  (looking-at "$"))
        (message-delete-line))

      ;; óÏÂÓÔ×ÅÎÎÏ ÃÉÔÉÒÏ×ÁÎÉÅ
      (goto-char beg)
      (while (not (eobp))
        ;; úÁÍÅÎÉÍ ÔÁÂÕÌÑÃÉÉ ÎÁ ÐÒÏÂÅÌÙ
        (beginning-of-line)
        (while (re-search-forward "\011" (point-at-eol) t)
          (replace-match "        "))

        ;; ïÔË×ÏÔÉÍ
        (beginning-of-line)
        (unless (eolp)
          (if (not SNP:quote-initials)
              (insert "> ")
            (if (re-search-forward "^ *\\([a-zA-Zà-ÿÀ-ß]*\\)\\(>+\\)"
                                   (point-at-eol) t)
                (replace-match "\\1>\\2")
              (insert initials "> "))))

        (next-line 1))
      (widen))
    (insert "\n")))

(setq mail-citation-hook
      '(lambda ()
         (SNP:citation)
         (goto-char (point-min))
         (search-forward "\n\n")
         (SNP:citation-line)))

(defun SNP:break-cited-line ()
  (interactive)
  (if (or (bolp) (eolp))
      (insert "\n")
    (let ((quote-string nil))
      (save-excursion
        (beginning-of-line)
        (when (re-search-forward "^ *[a-zA-ZÀ-ßà-þ]*>+" (point-at-eol) t)
          (setq quote-string (match-string 0))))
      (if quote-string
          (insert (concat "\n" quote-string))
        (insert "\n")))))

;;; emacs-rc-gnus.el ends here
