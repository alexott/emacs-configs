;;; emacs-rc-prog-misc.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-prog-misc.el,v 0.0 2003/11/20 11:30:47 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/programming")
;;; find-func
(load "find-func")
(global-set-key [(control ?c) ?f] 'find-function)
(global-set-key [(control ?c) ?4 ?f] 'find-function-other-window)
(global-set-key [(control ?c) ?5 ?f] 'find-function-other-frame)
(global-set-key [(control ?c) ?k] 'find-function-on-key)

;; VCS
;; (require 'vc)
(require 'psvn)

;; Working with RPM specs
(autoload 'rpm-spec-mode "rpm-spec-mode" "RPM spec mode." t)
(add-to-list 'auto-mode-alist '("\\.spec$" . rpm-spec-mode))

(autoload 'smerge-mode "smerge-mode" nil t)

(autoload 'po-mode "po-mode"  "Major mode for translators to edit PO files" t)
(add-to-list 'auto-mode-alist '("\\.po$\\|\\.po\\." . po-mode))

(add-to-list 'auto-mode-alist '("\\.log$" . auto-revert-mode))

;; support for CMake
(require 'cmake-mode)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(defun my-cmake-mode-hook ()
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\C-c\C-c" 'comment-region)
  (local-set-key "\C-u\C-c\C-c" 'uncomment-region)
  )
(add-hook 'cmake-mode-hook 'my-cmake-mode-hook)

;; gdb/gud
(setq gdb-many-windows t)
(setq gdb-show-main t)
(setq gud-chdir-before-run nil)
(setq gud-tooltip-mode t)

;; automatically indenting yanked text if in programming-modes
;; (defvar yank-indent-modes '(emacs-lisp-mode lisp-mode
;;                             c-mode c++-mode js2-mode
;;                             tcl-mode sql-mode
;;                             perl-mode cperl-mode
;;                             java-mode jde-mode
;;                             lisp-interaction-mode
;;                             LaTeX-mode TeX-mode)
;;   "Modes in which to indent regions that are yanked (or yank-popped)")

;; (defvar yank-advised-indent-threshold 1000
;;   "Threshold (# chars) over which indentation does not automatically occur.")

;; (defun yank-advised-indent-function (beg end)
;;   "Do indentation, as long as the region isn't too large."
;;   (if (<= (- end beg) yank-advised-indent-threshold)
;;       (indent-region beg end nil)))

;; (defadvice yank (after yank-indent activate)
;;   "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
;;   (if (and (not (ad-get-arg 0))
;;            (member major-mode yank-indent-modes))
;;       (let ((transient-mark-mode nil))
;;        (yank-advised-indent-function (region-beginning) (region-end)))))

;; (defadvice yank-pop (after yank-pop-indent activate)
;;   "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
;;   (if (and (not (ad-get-arg 0))
;;            (member major-mode yank-indent-modes))
;;      (let ((transient-mark-mode nil))
;;      (yank-advised-indent-function (region-beginning) (region-end)))))

;; flymake
(require 'flymake)
;; todo - simply clear all default rules?
(setq flymake-allowed-file-name-masks (delete '("\\.c\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cpp\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cs\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.tex\\'" flymake-simple-tex-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) flymake-allowed-file-name-masks))
;; (delete ' flymake-allowed-file-name-masks)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; company-mode
(require 'company-mode)
(require 'company-bundled-completions)
(company-install-bundled-completions-rules)

;; gtags
(autoload 'gtags-mode "gtags" "" t)

;; clean trailing whitespaces automatically
(setq my-trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode
                                              lisp-mode scheme-mode))
(defun my-trailing-whitespace-hook ()
  (when (member major-mode my-trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'my-trailing-whitespace-hook)

;; untabify some modes
(setq my-untabify-modes '(haskell-mode emacs-lisp-mode lisp-mode scheme-mode))
(defun my-untabify-hook ()
  (when (member major-mode my-untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'my-untabify-hook)

;; cleanup code

(setenv "CVS_RSH" "ssh")


;;; emacs-prog-misc.el ends here
