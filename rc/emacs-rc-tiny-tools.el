;;; emacs-rc-tiny-tools.el --- Working with tiny tools 

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-rc-tiny-tools.el,v 0.0 2003/11/20 07:49:34 ott Exp $
;; Keywords: 
;; Requirements: http://tiny-tools.sf.net
;; Status: not intended to be distributed yet


(add-to-list 'load-path "/jet/ott/reps/anon/emacs-stuff/tiny-tools/lisp/other")
(add-to-list 'load-path "/jet/ott/reps/anon/emacs-stuff/tiny-tools/lisp/tiny")

;; Customizing tiny-perl
;;(require 'tinyperl)
;;(setq tinyperl-:pod-buffer-control 'many)
;;(setq tinyperl-:key-pageup-control nil)

;;(add-hook 'tinydesk-:load-hook 'tinydesk-default-emacs-keybindings)
;;(require 'tinydesk)

;;(require 'tinydiff)
(require 'tinydired)

;; Emacs lisp stuff
(require 'tinylisp)
(require 'eldoc)

;; Tags
(setq tinytag-:database-dir "~/emacs/config")
(autoload 'tinytag-install    "tinytag" "" t)
(autoload 'tinytag-main       "tinytag" "" t)
(autoload 'tinytag-main-mouse "tinytag" "" t)
(add-hook 'c++-mode-hook      'tinytag-install)
(add-hook 'c-mode-hook        'tinytag-install)
(add-hook 'java-mode-hook     'tinytag-install)

;;; emacs-rc-tiny-tools.el ends here
