;;; emacs-rc-emms.el --- 

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(add-to-list 'load-path "/jet/ott/reps/anon/emacs-stuff/emms")
(require 'emms)

(require 'emms-default)
(require 'later-do)
(emms-setup 'advanced "/net/smap1/mmedia/Music/")
(require 'emms-pbi)
(require 'emms-pbi-mark)

;;(add-hook 'emms-player-started-hook 'emms-show)
;;(remove-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "emms now playing: %s")

(setq emms-source-file-default-directory "/net/smap1/mmedia/Music/")
(setq emms-player-mpg321-parameters '("-o" "alsa"))

(global-set-key "\C-cew" 'emms-show)
(global-set-key "\C-cen" 'emms-next)
(global-set-key "\C-cep" 'emms-previous)
(global-set-key "\C-ces" 'emms-stop)
(global-set-key "\C-cer" 'emms-start)
(global-set-key "\C-cel" 'emms-pbi)

;;; emacs-rc-emms.el ends here
