
;;; emacs-rc-clojure.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'clojure-mode)
(require 'cider)
(require 'clj-refactor)
(autoload 'align-cljlet "align-cljlet" nil t)

(add-to-list 'auto-mode-alist '("\\.\\(cljs?\\|dtm\\|edn\\)$" . clojure-mode))

(setq cider-words-of-inspiration '(""))

;; Custom indentation rules; see clojure-indent-function
(define-clojure-indent
  (describe 'defun)
  (testing 'defun)
  (given 'defun)
  (using 'defun)
  (with 'defun)
  (it 'defun)
  (do-it 'defun)
  (go-loop 'defun))

(defun alexott/clojure-mode-hook ()
  "Hook for Clojure mode"
  (turn-on-eldoc-mode)
  (whitespace-mode 1)
;;  (smartparens-mode 1)
  (paredit-mode 1)
  (rainbow-delimiters-mode 1)
  (clj-refactor-mode 1)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-c\C-c" 'cider-eval-expression-at-point)
  )
(add-hook 'clojure-mode-hook 'alexott/clojure-mode-hook)

;; NRepl/CIDER
(defun alexott/nrepl-mode-hook ()
  (cider-turn-on-eldoc-mode)
;;  (smartparens-mode 1)
  (paredit-mode 1)
  (rainbow-delimiters-mode 1)
  (ac-nrepl-setup)
  (local-set-key [return] 'cider-repl-return)
  (local-set-key "\C-c\C-c" 'cider-interrupt)
  )
(add-hook 'cider-repl-mode-hook 'alexott/nrepl-mode-hook)

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)

(add-to-list 'same-window-buffer-names "*cider-repl*")


(cljr-add-keybindings-with-prefix "C-c C-q")
