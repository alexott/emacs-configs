;;; emacs-rc-yasnippet.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
;; TODO: move my templates into separate directory?
(yas/load-directory "~/emacs/yasnippet/snippets")

;;; emacs-rc-yasnippet.el ends here
