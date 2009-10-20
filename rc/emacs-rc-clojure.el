
;;; emacs-rc-clojure.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/clojure")
;; clojure-mode
;;(require 'clojure-mode)
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(defun alexott/clojure-mode-hook ()
  "Hook for Clojure mode"
  )
(add-hook 'clojure-mode-hook 'alexott/common-hook)
(add-hook 'clojure-mode-hook 'alexott/show-prog-keywords)
(add-hook 'clojure-mode-hook 'alexott/clojure-mode-hook)

(setq clojure-home (concat (expand-file-name "~") "/emacs/clojure/"))

(setq other-jar (string-join ":" (file-expand-wildcards "~/share/java/*.jar" t)))

(setq swank-clojure-binary "clj-cmd")
(defvar clj-cmd)
(setenv "CLJ_CMD"
        (setq clj-cmd
              (concat "java "
                      "-server "
                      "-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888 "
                      "-cp "
                      (concat clojure-home "clojure.jar:")
                      (concat clojure-home "clojure-contrib.jar:")
                      (concat clojure-home "swank-clojure.jar:")
                      other-jar
                      " clojure.lang.Repl")))

;; swank-clojure
(require 'swank-clojure-autoload)
(swank-clojure-config
 (setq swank-clojure-jar-path (concat clojure-home "clojure.jar"))
 (setq swank-clojure-extra-classpaths (list (concat clojure-home "clojure-contrib.jar")))
 )


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

(setq slime-browse-local-javadoc-root (concat (expand-file-name "~") "/lisp/docs/" "java"))

(defun slime-browse-local-javadoc (ci-name)
  "Browse local JavaDoc documentation on Java class/Interface at point."
  (interactive (list (slime-read-symbol-name "Class/Interface name: ")))
  (when (not ci-name)
    (error "No name given"))
  (let ((name (replace-regexp-in-string "\\$" "." ci-name))
        (path (concat (expand-file-name slime-browse-local-javadoc-root) "/docs/api/")))
    (with-temp-buffer
      (insert-file-contents (concat path "allclasses-noframe.html"))
      (let ((l (delq nil
                     (mapcar #'(lambda (rgx)
                                 (let* ((r (concat "\\.?\\(" rgx "[^./]+\\)[^.]*\\.?$"))
                                        (n (if (string-match r name)
                                               (match-string 1 name)
                                             name)))
                                   (if (re-search-forward (concat "<A HREF=\"\\(.+\\)\" +.*>" n "<.*/A>") nil t)
                                       (match-string 1)
                                     nil)))
                             '("[^.]+\\." "")))))
        (if l
            (browse-url (concat "file://" path (car l)))
          (error (concat "Not found: " ci-name)))))))

(add-hook 'slime-connected-hook (lambda ()
;;                                  (require 'clojure-mode)
;;                                  (slime-redirect-inferior-output)
                                  (def-slime-selector-method ?j
                                    "most recently visited clojure-mode buffer."
                                    (slime-recently-visited-buffer 'clojure-mode))
                                  (define-key slime-mode-map (kbd "<return>") 'newline-and-indent)
                                  (define-key slime-mode-map (kbd "C-j") 'newline)
                                  (define-key slime-mode-map (kbd "C-c b") 'slime-browse-local-javadoc)
                                  (define-key slime-repl-mode-map (kbd "C-c b") 'slime-browse-local-javadoc)
                                  (define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
                                  (define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)
                                  (define-key slime-mode-map (kbd "C-c D") 'slime-javadoc)
                                  (define-key slime-repl-mode-map (kbd "C-c D") 'slime-javadoc)))


;;; emacs-rc-clojure.el ends here
