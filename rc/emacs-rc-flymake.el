;;; emacs-rc-flymake.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; flymake
(require 'flymake)
;; todo - simply clear all default rules?
(setq flymake-allowed-file-name-masks (delete '("\\.c\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cpp\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cs\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.tex\\'" flymake-simple-tex-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) flymake-allowed-file-name-masks))
;; (delete ' flymake-allowed-file-name-masks)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;;; emacs-rc-flymake.el ends here
