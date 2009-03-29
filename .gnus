;;;; -*- mode: emacs-lisp -*-
;;
;; GNUS Customization
;; Alex Ott <alexott@gmail.com>
;;

(setq nntp-marks-is-evil nil)
(setq nnml-marks-is-evil nil)

;; Mailcrypt
(add-to-list 'load-path "~/emacs/mailcrypt")
(require 'mailcrypt)
(mc-setversion "gpg")
(add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)
(add-hook 'message-mode-hook 'mc-install-write-mode)
(add-hook 'news-reply-mode-hook 'mc-install-write-mode)
(setq mc-gpg-user-id "Alex Ott <alexott@gmail.com>")


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

;; Message hook
(add-hook  'message-mode-hook
					 '(lambda ()
							(auto-fill-mode t)
							(font-lock-mode t)
							(abbrev-mode t)
							(setq fill-column 75)
							(flyspell-mode 1)
							))

;; Sorting
(setq gnus-article-sort-functions
			'(
        gnus-article-sort-by-number
				gnus-article-sort-by-subject
        gnus-article-sort-by-date
				))

(setq gnus-thread-sort-functions
			'(gnus-thread-sort-by-number
				gnus-thread-sort-by-subject
				gnus-thread-sort-by-total-score
				gnus-thread-sort-by-date
				))

;; ;; Set format of group description
(setq gnus-group-line-format "%M\%S\%p\%5y: %g\n")

;; ;; Topic-Mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-topic-line-format "%i%3A: %(%{%n%}%)%v\n")

;; fix summary mode error
(copy-face 'default 'mythreads)
(set-face-foreground 'mythreads "blue")
(setq gnus-face-3 'mythreads)

(copy-face 'default 'mybiggernumbers)
(set-face-foreground 'mybiggernumbers "indianred4")
(setq gnus-face-6 'mybiggernumbers)
(setq gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23n%]%) %s\n")

;; Fetch headers for old articles in current thread
(setq gnus-fetch-old-headers '500)

;; remove automatic total expire hook
(remove-hook 'gnus-summary-prepare-exit-hook
						 'gnus-summary-expire-articles)
(add-hook 'gnus-exit-gnus-hook
					'gnus-group-expire-all-groups)

;; for sent mail via smtp-server
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)
(setq nnml-get-new-mail t)

;;
(setq gnus-gcc-mark-as-read t)
(setq gnus-show-mime t)
(setq gnus-show-mime-method 'gnus-article-preview-mime-message)
(setq gnus-expert-user t)
(setq gnus-suppress-duplicates t)
(setq gnus-confirm-mail-reply-to-news t)

(custom-set-variables
 '( gnus-activate-level 3)
 '( gnus-agent nil)
 '( gnus-agent-cache nil)
 '(gnus-asynchronous t)
 '(gnus-use-header-prefetch t)
 '( gnus-default-charset (quote koi8-r))
 '( gnus-default-posting-charset (quote koi8-r))
 '( gnus-expert-user nil)
 '( gnus-group-charset-alist (quote (("\\(^\\|:\\)hk\\>\\|\\(^\\|:\\)tw\\>\\|\\<big5\\>" cn-big5) ("\\(^\\|:\\)cn\\>\\|\\<chinese\\>" cn-gb-2312) ("\\(^\\|:\\)fj\\>\\|\\(^\\|:\\)japan\\>" iso-2022-jp-2) ("\\(^\\|:\\)tnn\\>\\|\\(^\\|:\\)pin\\>\\|\\(^\\|:\\)sci.lang.japan" iso-2022-7bit) ("\\(^\\|:\\)relcom\\>" koi8-r) ("alt\\.russian\\.z1" koi8-r) ("\\(^\\|:\\)fido7\\>" koi8-r) ("\\(^\\|:\\)\\(cz\\|hun\\|pl\\|sk\\|hr\\)\\>" iso-8859-2) ("\\(^\\|:\\)israel\\>" iso-8859-1) ("\\(^\\|:\\)han\\>" euc-kr) ("\\(^\\|:\\)alt.chinese.text.big5\\>" chinese-big5) ("\\(^\\|:\\)soc.culture.vietnamese\\>" vietnamese-viqr) ("\\(^\\|:\\)\\(de\\|comp\\|rec\\|sci\\|soc\\|news\\|gnu\\|bofh\\)\\>" iso-8859-1))))
 '( gnus-group-name-charset-group-alist nil)
 '( gnus-group-name-charset-method-alist (quote (("nil" . koi8-r))))
 '( gnus-group-posting-charset-alist (quote (("\\(^\\|:\\)\\(de\\|comp\\|rec\\|alt\\|sci\\|soc\\|news\\|gnu\\|bofh\\)\\>" iso-8859-1 t) (".*" koi8-r t))))
 '( gnus-newsgroup-charset (quote koi8-r) t)
 '( gnus-newsgroup-ignored-charsets (quote (unknown-8bit x-unknown koi8-u)))
 '( gnus-summary-ignore-duplicates t)
 '( gnus-use-cache (quote passive))
 '(gnus-spam-process-destinations (quote ((".*" "nnml:SPAM-new"))))
 '( mail-source-delete-incoming t)
 '( message-send-mail-function (quote smtpmail-send-it))
 '( message-send-mail-partially-limit 3000000)
 '( mm-default-directory "~/")
 '( mm-inline-text-html-with-images t)
 '(mm-discouraged-alternatives nil)
 '(mm-w3m-safe-url-regexp nil)
 '(mm-text-html-renderer (quote w3m))
;; '( mm-text-html-renderer (quote links))
 '( nnimap-split-rule nil)
 '( nnmail-crosspost nil)
 '(message-send-mail-partially-limit nil)
 '( nnmail-split-abbrev-alist (quote ((any . "from\\|to\\|cc\\|sender\\|apparently-to\\|resent-from\\|resent-to\\|resent-cc") (mail . "mailer-daemon\\|postmaster\\|uucp") (to . "to\\|cc\\|apparently-to\\|resent-to\\|resent-cc") (from . "from\\|sender\\|resent-from") (nato . "to\\|cc\\|resent-to\\|resent-cc") (naany . "from\\|to\\|cc\\|sender\\|resent-from\\|resent-to\\|resent-cc") (spam-flag . "x-spam-flag") (list-id . "list-id") (reply-to . "reply-to") (subject . "subject") (mail-list . "x-mailing-list")))))


;(gnus-demon-add-handler 'gnus-demon-scan-mail 20 10)
;;(gnus-demon-add-handler 'gnus-demon-scan-news 60 nil)
;(gnus-demon-add-scanmail)
;(setq gnus-use-demon t)
;(gnus-demon-init)

(load "~/emacs/rc/emacs-rc-bbdb.el")
(load "~/emacs/rc/emacs-rc-gnus.el")
;; Mail catching part
;;(load "~/emacs/rc/emacs-rc-gnus-spam.el")
;; Mail splitting part
(load "~/emacs/rc/emacs-rc-gnus-split.el")
(load (concat "~/emacs/rc/emacs-rc-gnus-" (system-name) ".el"))

;; to work better
(gnus-compile)



