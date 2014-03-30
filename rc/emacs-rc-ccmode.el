;;; emacs-rc-ccmode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'cc-mode)

(load "c-eldoc")
(setq c-eldoc-includes "-I~/exp/include -I./ -I../ ")

;; taken from http://stackoverflow.com/questions/14715689/emacs-different-indentation-for-class-and-struct
(defun my-c-lineup-inclass (langelem)
  (let ((inclass (assoc 'inclass c-syntactic-context)))
    (save-excursion
      (goto-char (c-langelem-pos inclass))
      (if (or (looking-at "struct")
              (looking-at "typedef struct"))
          '+
        '++))))

;; customisation of cc-mode
(defun alexott/c-mode-common-hook ()
  ;; style customization
  (c-set-style "bsd")
  (setq tab-width 4)
  (setq   indent-tabs-mode t)
;;  (c-set-offset 'substatement-open 0)
  (c-set-offset 'access-label '-)
  (c-set-offset 'topmost-intro 0)
  (c-set-offset 'inclass 'my-c-lineup-inclass)
;;  (c-set-offset 'member-init-intro '++)
  (c-toggle-auto-hungry-state 0)
  (setq c-basic-offset 4)
  ;; minor modes
  (auto-fill-mode 1)
  (c-turn-on-eldoc-mode)
  (gtags-mode 1)
  (hs-minor-mode 1)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-prog-hook)

(require 'info-look)
(info-lookup-add-help
 :mode 'c-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(libc)Symbol Index" nil nil nil)))

(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(add-hook 'c-mode-hook 'fp-c-mode-routine)

(setq-default c-default-style (quote ((java-mode . "java") (other . "gnu"))))

(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;;
(require 'cuda-mode)

;; function args...
(require 'function-args)
(fa-config-default)

;; documentation browser for C++
;; taken from https://gist.github.com/randomphrase/9177867

(defun c++-type-at (point)
  "Use semantic to determine the fully namespace-qualified type of the symbol at POINT."
  (interactive "d")
  (let* ((ctxt (semantic-analyze-current-context point))
	 (pf (reverse (oref ctxt prefix)))
	 (lastname (pop pf))
	 (tag (if (semantic-tag-p lastname) lastname (car pf)))
	 (names (append
		 (when (semantic-tag-p tag)
		   (save-excursion
		     (when (semantic-tag-with-position-p tag)
		       (set-buffer (semantic-tag-buffer tag))
		       (semantic-go-to-tag tag)
		       (mapcar 'semantic-tag-name (semantic-analyze-scope-nested-tags (point) nil)))))
		 (list (if (semantic-tag-p lastname) (semantic-tag-name lastname) lastname)))))
    (concat (mapconcat 'concat names "::"))))

(defvar c++-doco-sources
  '(("std::" .
     "http://en.cppreference.com/mwiki/index.php?title=Special:Search&search=%s")
    ("boost::" . "http://google.com/search?q=site:boost.org%%20%s")
    ))

(defun semantic-browse-c++-doc (point)
  "Browse the documentation for the C++ symbol at POINT."
  (interactive "d")
  (let* ((cpptype (c++-type-at point))
	 (ref (when (stringp cpptype)
		(car (cl-member-if (lambda (S) (string-prefix-p (car S) cpptype))
				   c++-doco-sources)))))
    (if ref	
	(browse-url (format (cdr ref) cpptype))
      (message "No documentation source found for %s" cpptype))))

(defun alexott/c++-doc-hook ()
  (local-set-key "\C-cw" 'semantic-browse-c++-doc)
  )
(add-hook 'c++-mode-hook 'alexott/c++-doc-hook)

;;; emacs-rc-cmode.el ends here
