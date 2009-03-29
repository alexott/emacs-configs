;;; emacs-rc-misc-things.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet


;; load path
(push "~/emacs/misc" load-path)
(push "~/emacs/programming" load-path)

;;
(add-to-list 'file-coding-system-alist (cons "spam-stat.el"  'utf-8))
(add-to-list 'file-coding-system-alist (cons "\\.bbdb"  'utf-8))
(add-to-list 'file-coding-system-alist (cons "/clusterfs/"  'koi8-r))

;; for dired
;;(setenv "LC_TIME" "C")
(setenv "TEXINPUTS" (concat (getenv "TEXINPUTS") ":/home/ott/tex/styles//"))

;;============================================================
;; iswitchb
;;============================================================
(require 'iswitchb)
(iswitchb-mode 1)
(setq iswitchb-case t)
;;(require 'filecache)
;;(load "iswitchb-fc")
(add-to-list 'iswitchb-buffer-ignore "^ ")
(add-to-list 'iswitchb-buffer-ignore "\\*ECB")
(add-to-list 'iswitchb-buffer-ignore "\\*ESS\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*Backtrace")
(add-to-list 'iswitchb-buffer-ignore "\\*Quail Com")
(add-to-list 'iswitchb-buffer-ignore "\\*Buffer")
(add-to-list 'iswitchb-buffer-ignore "\\*Help")
(add-to-list 'iswitchb-buffer-ignore "\\*fsm-debug")
(add-to-list 'iswitchb-buffer-ignore "\\*Completions")
(add-to-list 'iswitchb-buffer-ignore "\\.cvsignore")
(add-to-list 'iswitchb-buffer-ignore "\\*cvs-commit")
(add-to-list 'iswitchb-buffer-ignore "\\*info\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*sent reply")
(add-to-list 'iswitchb-buffer-ignore "\\.newsrc-dribble")
(add-to-list 'iswitchb-buffer-ignore "\\*Calendar\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*reg group-leader\\*")
(add-to-list 'iswitchb-buffer-ignore "^[tT][aA][gG][sS]$")
(add-to-list 'iswitchb-buffer-ignore "\\*sent mail")
(add-to-list 'iswitchb-buffer-ignore "\\*sent wide reply")
(add-to-list 'iswitchb-buffer-ignore "\\*trace of SMTP")
(add-to-list 'iswitchb-buffer-ignore "\\*Compile-Log\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*semantic")
(add-to-list 'iswitchb-buffer-ignore "\\*Calc")
(add-to-list 'iswitchb-buffer-ignore "\\*Article\\*")
(add-to-list 'iswitchb-buffer-ignore "\\.bbdb")
(add-to-list 'iswitchb-buffer-ignore "irc\\.")
(add-to-list 'iswitchb-buffer-ignore "\\*Customize")
(add-to-list 'iswitchb-buffer-ignore "\\*Shell Command")
(add-to-list 'iswitchb-buffer-ignore "\\*svn")
(add-to-list 'iswitchb-buffer-ignore "\\*w3m\\*")
(add-to-list 'iswitchb-buffer-ignore "\\.hgignore")
(add-to-list 'iswitchb-buffer-ignore "\\*git-")
(add-to-list 'iswitchb-buffer-ignore "\\*Git ")
(add-to-list 'iswitchb-buffer-ignore "\\*slime-")
(add-to-list 'iswitchb-buffer-ignore "\\*inferior-")
(add-to-list 'iswitchb-buffer-ignore "\\*Apropos\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*BBDB\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*gitsum")
(add-to-list 'iswitchb-buffer-ignore "\\*magit")
(add-to-list 'iswitchb-buffer-ignore "\\*cvs\\*")
(add-to-list 'iswitchb-buffer-ignore "\\*CEDET")
(add-to-list 'iswitchb-buffer-ignore "\\*GTAGS")
(add-to-list 'iswitchb-buffer-ignore "\\*Symref")
(add-to-list 'iswitchb-buffer-ignore "^\\.cabal$")
;;(add-to-list 'iswitchb-buffer-ignore "")
;;(add-to-list 'iswitchb-buffer-ignore "")


;; misc variables
(setq auto-compression-mode t)
(setq safe-local-variable-values (quote ((prompt-to-byte-compile) (c-indentation-style . k&r) (indent-tabs-mode . 1) (folded-file . t))))
(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
(setq user-full-name "Alex Ott")

(custom-set-variables
 '(safe-local-variable-values (quote ((encoding . utf-8) (prompt-to-byte-compile)
                                      (c-indentation-style . k&r) (indent-tabs-mode . 1)
                                      (folded-file . t)))))

;; Hide/Show mode
(require 'hideshow)

;; twitter
(load "~/emacs/misc/twit.el")

;; boxquote
;; (require 'boxquote)
;; (global-set-key (kbd "C-c b y")   'boxquote-yank)
;; (global-set-key (kbd "C-c b r")   'boxquote-region)
;; (global-set-key (kbd "C-c b u")   'boxquote-unbox-region)
;; (global-set-key (kbd "C-c b t")   'boxquote-title)
;; (global-set-key (kbd "C-c b i")   'boxquote-insert-file)
;; (global-set-key (kbd "C-c b k")   'boxquote-kill)
;; (global-set-key (kbd "C-c b s")   'boxquote-shell-command)
;; (global-set-key (kbd "C-c b b")   'boxquote-buffer)
;; (global-set-key (kbd "C-c b p")   'boxquote-paragraph)
;; (global-set-key (kbd "C-c b n")   'boxquote-narrow-to-boxquote)
;; (global-set-key (kbd "C-c b w")   'boxquote-where-is)
;; (global-set-key (kbd "C-c b d f") 'boxquote-describe-function)
;; (global-set-key (kbd "C-c b d k") 'boxquote-describe-key)
;; (global-set-key (kbd "C-c b d v") 'boxquote-describe-variable)

;; table
(require 'table)

;; Wiki Edit
;;(require 'oddmuse)
;;(setq url-proxy-services '(("http" . "your.proxy.host:portnumber")) ; if needed
;;(oddmuse-mode-initialize)

;; moin-moin editing
(require 'moinmoin-mode)
(add-hook 'outline-mode-hook 'turn-on-flyspell)

;; dokuwiki
(global-unset-key [(control v)])
(require 'dokuwiki)
(add-to-list 'auto-mode-alist '("\\.doku?$" . simple-dokuwiki-mode))
(add-hook 'simple-dokuwiki-mode-hook 'turn-on-flyspell)
(custom-set-faces
 '(simple-wiki-teletype-face ((((class color) (background light)) (:underline "darkgreen")))))

;; htmlize
(require 'htmlize)
(setq htmlize-output-type 'inline-css)
(defun add-google-analytics ()
  (while (search-forward "</body>" nil t)
    (replace-match "\n<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n</script>\n<script type=\"text/javascript\">\n _uacct = \"UA-78697-3\";\n  urchinTracker();\n</script>\n</body>" nil t))
  )
(add-hook 'htmlize-after-hook 'add-google-analytics)


;; untabify
(defun untabify-file ()
      (save-excursion
       (delete-trailing-whitespace)
       (untabify (point-min) (point-max))))

;; footnote mode
(autoload 'footnote-mode "footnote" nil t)
;; (require 'footnote-init)
;; (defun my-fn-hook ()
;;  (footnote-init)
;;  )
;; (add-hook 'footnote-mode-hook 'my-fn-hook)

;;; emacs-rc-misc-things.el ends here

