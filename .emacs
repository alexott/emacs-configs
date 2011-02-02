;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/Users/ott/.cabal/bin:/opt/local/bin:/usr/local/bin:/usr/local/texlive/2008/bin/universal-darwin/:/Users/ott/bin:/Users/ott/exp/bin:" (getenv "PATH")))
  (setenv "DYLD_FALLBACK_LIBRARY_PATH" "/usr/lib:/opt/local/lib:/usr/X11R6/lib:~/exp/lib")
  (push "/opt/local/bin" exec-path)
  (push "/usr/local/bin" exec-path)
  (push "/Users/ott/bin" exec-path)
  (push "/Users/ott/exp/bin" exec-path)
  )
(when (string= (system-name) "alexott")
  (setenv "PATH" (concat "/home/ott.cabal/bin:/home/ott/exp/bin:" (getenv "PATH")))
  (push "/home/ott.cabal/bin" exec-path)
  (push "/home/ott/exp/bin" exec-path)
  )

;; el-get

(add-to-list 'load-path "~/projects/el-get/")
(require 'el-get)
(setq el-get-recipe-path  '("~/projects/el-get/recipes/"))
(setq el-get-sources '(magit psvn org-mode haskell-mode haskell-mode-exts shime
			     auctex erlware-mode scala-mode ; sbt ensime
                             distel slime bbdb clojure-mode cedet ess g-client
                             emacs-jabber ahg doxymacs emacs-w3m geiser dvc
                             (:name muse
                                    :type git
                                    :url "git@github.com:alexott/muse.git"
                                    :load-path ("./lisp")
                                    :build ("make")
                                    :features muse-autoloads
                                    )
                             planner remember
			     xml-rpc-el n3-mode))
(el-get 'sync)

;;(el-get-update-all)

;; add commonly used paths
(push "~/emacs/misc" load-path)
(push "~/projects/emacs-addons" load-path)
(push "~/emacs/programming" load-path)

;; load concrete packages
(load "~/emacs/rc/emacs-rc-mule.el")
(load "~/emacs/rc/emacs-rc-misc-things.el")
(load "~/emacs/rc/emacs-rc-common-hooks.el")
(load "~/emacs/rc/emacs-rc-decor.el")
(load "~/emacs/rc/emacs-rc-kbd.el")
(load "~/emacs/rc/emacs-rc-info.el")
(load "~/emacs/rc/emacs-rc-osd.el")
(load "~/emacs/rc/emacs-rc-yasnippet.el")
;;(load "~/emacs/rc/emacs-rc-autocomplete.el")
;; TODOs, etc.
(load "~/emacs/rc/emacs-rc-remember.el")
(load "~/emacs/rc/emacs-rc-org-mode.el")
;; text editing
(load "~/emacs/rc/emacs-rc-ispell.el")
(load "~/emacs/rc/emacs-rc-muse.el")
(load "~/emacs/rc/emacs-rc-tex.el")
(load "~/emacs/rc/emacs-rc-nxml.el")
(load "~/emacs/rc/emacs-rc-html.el")
(load "~/emacs/rc/emacs-rc-wikis.el")
;; programming tools & languages
(load "~/emacs/rc/emacs-rc-prog-misc.el")
(load "~/emacs/rc/emacs-rc-flymake.el")
(load "~/emacs/rc/emacs-rc-gdb.el")
(load "~/emacs/rc/emacs-rc-ccmode.el")
(load "~/emacs/rc/emacs-rc-python.el")
;(load "~/emacs/rc/emacs-rc-doxygen.el")
(load "~/emacs/rc/emacs-rc-cedet.el")
(load "~/emacs/rc/emacs-rc-elisp.el")
(load "~/emacs/rc/emacs-rc-ecb.el")
(load "~/emacs/rc/emacs-rc-prolog.el")
(load "~/emacs/rc/emacs-rc-javascript.el")
(load "~/emacs/rc/emacs-rc-scheme.el")
;;(load "~/emacs/rc/emacs-rc-ocaml.el")
(load "~/emacs/rc/emacs-rc-lisp.el")
(load "~/emacs/rc/emacs-rc-clojure.el")
(load "~/emacs/rc/emacs-rc-slime.el")
(load "~/emacs/rc/emacs-rc-erlang.el")
(load "~/emacs/rc/emacs-rc-haskell.el")
(load "~/emacs/rc/emacs-rc-scala.el")
(load "~/emacs/rc/emacs-rc-sh-mode.el")
(load "~/emacs/rc/emacs-rc-auto-insert.el")
(load "~/emacs/rc/emacs-rc-cmake.el")
;;
;; VCS & DVCS
(load "~/emacs/rc/emacs-rc-mercurial.el")
(load "~/emacs/rc/emacs-rc-dvc.el")
(load "~/emacs/rc/emacs-rc-git.el")
(load "~/emacs/rc/emacs-rc-vcs-misc.el")
;;
;; WWW, IM, social networking & blogging
;;(load "~/emacs/rc/emacs-rc-twitter.el")
(load "~/emacs/rc/emacs-rc-jabber.el")
(load "~/emacs/rc/emacs-rc-w3.el")
(load "~/emacs/rc/emacs-rc-erc.el")
(load "~/emacs/rc/emacs-rc-w3m.el")
;;(load "~/emacs/rc/emacs-rc-eblogger.el")
;;(load "~/emacs/rc/emacs-rc-lj.el")
;;
(load "~/emacs/rc/emacs-rc-epg.el")
(load "~/emacs/rc/emacs-rc-server.el")
(load "~/emacs/rc/emacs-rc-ess.el")
(load "~/emacs/rc/emacs-rc-pretty-lambda.el")
(load "~/emacs/rc/emacs-rc-sdcv.el")
(load "~/emacs/rc/emacs-rc-iswitchb.el")

;;(load "~/emacs/rc/emacs-rc-timeclock.el")
;;(load "~/emacs/rc/emacs-rc-autocomplete.el")
(load "~/emacs/rc/emacs-rc-gclient.el")
;; (load "~/emacs/rc/emacs-rc-.el")
;; (load "~/emacs/rc/emacs-rc-.el")

(defun alexott/get-short-hostname ()
  (let* ((sys-name (system-name))
         (idx (string-match "\\." sys-name)))
    (if idx
        (substring sys-name 0 idx)
      sys-name)))

(let* ((fname (concat "~/emacs/rc/emacs-rc-local-" (alexott/get-short-hostname) ".el")))
  (when (file-exists-p fname)
    (load fname)))

(load "~/emacs/rc/emacs-rc-desktop.el")

(load "~/emacs/passwords.el.gpg")

(load custom-file 'noerror)

;; for org-mode
(setq comment-start nil)

;; for emacs-jabber
(define-key ctl-x-map "\C-j" jabber-global-keymap)
