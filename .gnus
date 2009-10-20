;;;; -*- mode: emacs-lisp -*-
;;
;; GNUS Customization
;; Alex Ott <alexott@gmail.com>
;;

(require 'gnus-setup)
(require 'gnus-art)
(require 'gnus-cite)

;; setting for sending mail via smtp-server
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


;; Gnus Mail setup
(setq gnus-secondary-select-methods
      '((nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-expunge-on-close always)
;;                (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
;;                (nnmail-expiry-wait immediate)
                )
        (nnml "")))

;; (setq gnus-parameters '(("^nntp.*"
;;                          (gnus-fetch-old-headers t))
;;                         ("^nnimap.*"
;;                          (gnus-fetch-old-headers t))))

(setq gnus-posting-styles '((".*"
                             (Gcc "nnml:sent")
                             (Organization "Alex Ott's Consulting")
                             (signature-file "~/.signature"))))

;; Moving mails to trash in google mail
(setq gdt-trash-newsgroup "nnimap+gmail:[Gmail]/Trash")
(defun gdt-gnus-move-to-trash ()
  (interactive)
  (gnus-summary-move-article nil gdt-trash-newsgroup))

(add-hook 'gnus-summary-mode-hook
          (lambda ()
            (local-set-key "D" 'gdt-gnus-move-to-trash)))

;; Mail decoding
(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))

;; Hooks
(defun alexott/message-mode-hook ()
  (auto-fill-mode t)
  (font-lock-mode t)
  (abbrev-mode t)
  (setq fill-column 75)
  (orgstruct++-mode 1)
  (flyspell-mode 1))
(add-hook  'message-mode-hook 'alexott/message-mode-hook)

(defun alexott/mime/editor-mode-hook ()
  ;; (put-alist 'koi8-r nil
  ;;            mime-editor/charset-default-encoding-alist)
  (put-alist "Subject" nil mime/field-encoding-method-alist)
  (put-alist "To" nil mime/field-encoding-method-alist))
(add-hook 'mime/editor-mode-hook 'alexott/mime/editor-mode-hook)

(defun alexott/gnus-article-display-hook ()
  (gnus-article-highlight)
  (gnus-article-hide-headers-if-wanted)
  (setq gnus-visible-headers
        '("^From:" "^X-Comment-To:" "^Comment-To:" "^Subject:" "^Date:"
          "^Followup-To:" "^Reply-To:" "^Organization:" "^Summary:"
          "^Keywords:" "^To:" "^Cc:" "^Posted-To:" "^Mail-Copies-To:"
          "^Apparently-To:" "^Gnus-Warning:" "^Resent-From" "^Bcc:" ))
  (article-emphasize))
(add-hook 'gnus-article-display-hook 'alexott/gnus-article-display-hook)

(defun alexott/gnus-summary-mode-hook ()
;;  (local-set-key [tab] 'gnus-summary-next-unread-article)
  (save-excursion
    (goto-char (point-min))))
(add-hook 'gnus-summary-mode-hook 'alexott/gnus-summary-mode-hook)

;; automatic import of ical notice
;;(add-hook 'gnus-article-prepare-hook 'icalendar-import-buffer)

;; remove automatic total expire hook
(remove-hook 'gnus-summary-prepare-exit-hook
             'gnus-summary-expire-articles)
(add-hook 'gnus-exit-gnus-hook
          'gnus-group-expire-all-groups)

;; Sorting
(setq gnus-article-sort-functions '(gnus-article-sort-by-number
                                    gnus-article-sort-by-subject
                                    gnus-article-sort-by-date))

(setq gnus-thread-sort-functions '(gnus-thread-sort-by-number
                                   gnus-thread-sort-by-subject
                                   gnus-thread-sort-by-total-score
                                   gnus-thread-sort-by-date))

;; ;; Set format of group description
(setq gnus-group-line-format "%M\%S\%p\%5y: %g\n")

;; ;; Topic-Mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-topic-line-format "%i%3A: %(%{%n%}%)%v\n")

;; ;; fix summary mode error
;; (copy-face 'default 'mythreads)
;; (set-face-foreground 'mythreads "blue")
;; (setq gnus-face-3 'mythreads)

;; (copy-face 'default 'mybiggernumbers)
;; (set-face-foreground 'mybiggernumbers "indianred4")
;; (setq gnus-face-6 'mybiggernumbers)
(setq gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23n%]%) %s\n")

;; Fetch headers for old articles in current thread
(setq gnus-fetch-old-headers '500)

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

(setq news-reply-header-hook nil)

;;
(setq gnus-gcc-mark-as-read t
      nntp-marks-is-evil nil
      nnml-marks-is-evil nil
      gnus-show-mime t
      gnus-show-mime-method 'gnus-article-preview-mime-message
      gnus-expert-user t
      gnus-suppress-duplicates t
      gnus-confirm-mail-reply-to-news t
      gnus-ignored-newsgroups ""
      nnml-get-new-mail t
      gnus-add-to-list t
      gnus-large-newsgroup nil
      gnus-inhibit-startup-message t
      gnus-read-active-file nil
      gnus-check-new-newsgroups 'ask-server
      gnus-use-sc t
      gnus-select-method '(nnnil "")
      mail-signature t
      ;; default-mime-charset 'koi8-r
      ;; message-default-charset 'koi8-r
      gnus-strict-mime t
      mime-editor/transfer-level 8
      mime-editor/transfer-level-string "8bit"
      gnus-novice-user nil
      gnus-auto-select-next nil
      gnus-cite-minimum-match-count 1
      )

(custom-set-variables
 '(gnus-activate-level 3)
 '(gnus-agent nil)
 '(gnus-agent-cache nil)
 '(gnus-asynchronous t)
 '(gnus-use-header-prefetch t)
 ;; '(gnus-default-charset (quote koi8-r))
 ;; '(gnus-default-posting-charset (quote koi8-r))
 ;; '(gnus-newsgroup-charset (quote koi8-r) t)
 '(gnus-expert-user nil)
 '(gnus-group-name-charset-group-alist nil)
 '(gnus-group-name-charset-method-alist (quote (("nil" . koi8-r))))
 '(gnus-newsgroup-ignored-charsets (quote (unknown-8bit x-unknown koi8-u)))
 '(gnus-summary-ignore-duplicates t)
 '(gnus-use-cache (quote passive))
 '(mail-source-delete-incoming t)
 '(message-send-mail-function (quote smtpmail-send-it))
 '(message-send-mail-partially-limit 3000000)
 '(mm-default-directory "~/")
 '(mm-inline-text-html-with-images t)
 '(mm-discouraged-alternatives nil)
 '(mm-w3m-safe-url-regexp nil)
 '(mm-text-html-renderer (quote w3m))
 '(nnimap-split-rule nil)
 '(nnmail-crosspost nil)
 '(message-send-mail-partially-limit nil))

;; gnus daemon settings
;;(gnus-demon-add-handler 'gnus-demon-scan-mail 20 10)
;;(gnus-demon-add-handler 'gnus-demon-scan-news 60 nil)
;;(gnus-demon-add-scanmail)
;;(setq gnus-use-demon t)
;;(gnus-demon-init)




;; load auxiliary packages
(load "~/emacs/rc/emacs-rc-bbdb.el")
(load "~/emacs/rc/emacs-rc-mailcrypt.el")
(load "~/emacs/rc/emacs-rc-supercite.el")

;;(load (concat "~/emacs/rc/emacs-rc-gnus-" (system-name) ".el"))

;; to work faster
(gnus-compile)



