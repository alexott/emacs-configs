
;;; emacs-rc-clojure.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/clojure")
;; clojure-mode
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
;; TODO: add clojure-test-mode

(autoload 'clojure-test-mode "clojure-test-mode" "Clojure test mode" t)
(autoload 'clojure-test-maybe-enable "clojure-test-mode" "" t)

(defun alexott/clojure-mode-hook ()
  "Hook for Clojure mode"
  (turn-on-eldoc-mode)
  (whitespace-mode 1)
  (paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  (set (make-local-variable 'slime-lisp-implementations)
       (list (assoc 'clojure slime-lisp-implementations)))
  ;; clojure-test-mode
  (clojure-test-maybe-enable)
  )
(add-hook 'clojure-mode-hook 'alexott/common-hook)
(add-hook 'clojure-mode-hook 'alexott/common-prog-hook)
(add-hook 'clojure-mode-hook 'alexott/show-prog-keywords)
(add-hook 'clojure-mode-hook 'alexott/clojure-mode-hook)

(setq clojure-home (expand-file-name "~/emacs/clojure/"))

(defvar clj-cmd)
(setenv "CLJ_CMD"
        (setq clj-cmd
              (concat "java "
                      "-Xmx1g -Xms1g -server -XX:+UseConcMarkSweepGC -XX:+UseCompressedOops "
                      "-XX:+DoEscapeAnalysis -XX:+UseBiasedLocking -XX:PermSize=64M -XX:MaxPermSize=256M -XX:-UseGCOverheadLimit "
                      "-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888 "
                      "-cp " clojure-home  "*" " clojure.main")))

;; swank-clojure
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path (concat clojure-home "clojure.jar"))
 (setq swank-clojure-extra-classpaths (list (concat clojure-home "clojure-contrib.jar")))
 )

;; taken from Bill Climenson config
(defun slime-java-describe (symbol-name)
  "Get details on Java class/instance at point."
  (interactive (list (slime-read-symbol-name "Java Class/instance: ")))
  (when (not symbol-name)
    (error "No symbol given"))
  (save-excursion
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (insert (concat "(clojure.contrib.repl-utils/show " symbol-name ")"))
    (when symbol-name
      (slime-repl-return)
      (other-window 1))))

(defun slime-javadoc (symbol-name)
  "Get JavaDoc documentation on Java class at point."
  (interactive (list (slime-read-symbol-name "JavaDoc info for: ")))
  (when (not symbol-name)
    (error "No symbol given"))
  (set-buffer (slime-output-buffer))
  (unless (eq (current-buffer) (window-buffer))
    (pop-to-buffer (current-buffer) t))
  (goto-char (point-max))
  (insert (concat "(clojure.contrib.javadoc/javadoc " symbol-name ")"))
  (when symbol-name
    (slime-repl-return)
    (other-window 1)))


;; (defun alexott/clojure-slime-conn-hook ()
;;   ;; (require 'clojure-mode)
;;   ;; (slime-redirect-inferior-output)
;;   (def-slime-selector-method ?j "most recently visited clojure-mode buffer."
;;     (slime-recently-visited-buffer 'clojure-mode))
;;   (define-key slime-mode-map (kbd "<return>") 'newline-and-indent)
;;   (define-key slime-mode-map (kbd "C-j") 'newline)
;;   (define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
;;   (define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)
;;   (define-key slime-mode-map (kbd "C-c D") 'slime-javadoc)
;;   (define-key slime-repl-mode-map (kbd "C-c D") 'slime-javadoc)
;;   )
;; (add-hook 'slime-connected-hook 'alexott/clojure-slime-conn-hook)
;; (remove-hook 'slime-connected-hook 'alexott/clojure-slime-conn-hook)


;;; emacs-rc-clojure.el ends here
