;;; emacs-rc-jabber.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;;(add-to-list 'load-path "~/emacs/emacs-jabber")
;;(require 'jabber)
(require 'jabber-bookmarks)

(defun alexott/jabber-connect-hook (jc)
  (jabber-send-presence "" "I'm online" 10)
  (let* ((state-data (fsm-get-state-data jc))
         (server (plist-get state-data :server)))
    (message "%s" server)
    (if (string-equal server "gmail.com")
        (progn
;;          (jabber-groupchat-join jc "devil@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "haskell@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "lisp@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "emacs@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "icfpc@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "wax@conference.jabber.ru" "alexott")
;;          (jabber-groupchat-join jc "erlang@conference.jabber.ru" "alexott")
          (jabber-groupchat-join jc "clojure@conference.jabber.ru" "alexott")
          ))))
(add-hook 'jabber-post-connect-hooks 'alexott/jabber-connect-hook)

(defun alexott/jabber-chat-hook ()
  (auto-fill-mode -1))
(add-hook 'jabber-chat-mode-hook 'alexott/jabber-chat-hook)

(setq jabber-history-enabled t)
(setq jabber-use-global-history nil)
(setq jabber-roster-show-bindings nil)

(require 'jabber-autoaway)
(add-hook 'jabber-post-connect-hook 'jabber-autoaway-start)

(setq jabber-alert-info-message-hooks (quote (jabber-info-echo)))
(setq jabber-alert-message-hooks (quote (jabber-message-beep jabber-message-scroll)))
(setq jabber-alert-presence-hooks (quote (jabber-presence-update-roster)))
(setq jabber-nickname "alexott")
(setq jabber-resource (concat "at-"
                              (if (string-equal (system-name) "alexott")
                                  "work"
                                "home")))

(setq jabber-chat-buffer-show-avatar nil)
;; (setq jabber-vcard-avatars-retrieve nil
;;       jabber-vcard-avatars-publish nil
;;       )

(custom-set-variables
 '(jabber-auto-reconnect t)
 '(jabber-groupchat-buffer-format "*-jg-%n-*")
 '(jabber-roster-buffer "*-jroster-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s  %S")
 '(jabber-chat-buffer-format "*-jc-%n-*")
 '(jabber-muc-private-buffer-format "*-jmuc-priv-%g-%n-*")
 '(jabber-rare-time-format "%e %b %Y %H:00")
 )

(custom-set-faces
 '(jabber-chat-prompt-system ((t (:foreground "darkgreen" :weight bold))))
 )

(setq fsm-debug nil)

;;; emacs-rc-jabber.el ends here
