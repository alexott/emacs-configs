;;; emacs-rc-prog-misc.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Version: $Id: emacs-prog-misc.el,v 0.0 2003/11/20 11:30:47 ott Exp $
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; setup some variables explicitly
(setenv "CVS_RSH" "ssh")

;; gtags
(autoload 'gtags-mode "gtags" "" t)

;; Working with RPM specs
(autoload 'rpm-spec-mode "rpm-spec-mode" "RPM spec mode." t)
(add-to-list 'auto-mode-alist '("\\.spec$" . rpm-spec-mode))

;;
(autoload 'smerge-mode "smerge-mode" nil t)

;;
(autoload 'po-mode "po-mode"  "Major mode for translators to edit PO files" t)
(add-to-list 'auto-mode-alist '("\\.po$\\|\\.po\\." . po-mode))

;;
(require 'imenu)

;; whitespace mode
(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)
(custom-set-variables
 '(whitespace-global-mode nil)
 '(whitespace-modes (quote (awk-mode)))
 '(whitespace-silent t))

;;
(autoload 'rebox-comment "rebox" nil t)
(autoload 'rebox-region "rebox" nil t)

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


;; company-mode
;; (require 'company-mode)
;; (require 'company-bundled-completions)
;; (company-install-bundled-completions-rules)

;;; emacs-prog-misc.el ends here
