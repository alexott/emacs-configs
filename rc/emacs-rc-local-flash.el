;; local settings for mac

(semantic-add-system-include "/opt/local/include/" 'c++-mode)
(semantic-add-system-include "/opt/local/include/" 'c-mode)

(c++-setup-boost "/opt/local/include/boost")

;; info
(push "/opt/local/share/info" Info-directory-list)
(setenv "MANPATH" "/opt/local/man:/usr/share/man:/usr/local/man")

;;
(set-file-name-coding-system 'utf-8)
;; (normal-erase-is-backspace-mode t)

;; auto-inserts
(add-to-list 'auto-insert-alist '("\\.cpp$" . ["insert-home.cpp" auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '("\\.h$"   . ["insert-home.h" auto-update-header-file]))
(add-to-list 'auto-insert-alist '("\\.c$" . ["insert-home.cpp" auto-update-c-source-file]))

;;
(custom-set-variables
;; '(custom-file "~/.emacs")
 '(default-frame-alist nil)
 ;; '(one-buffer-one-frame-mode nil nil (aquamacs-frame-setup))
 '(cua-mode nil)
 '(transient-mark-mode t)
 ;; '(aquamacs-styles-mode nil nil (color-theme))
 ;; '(mac-input-method-mode nil)
 '(smart-frame-positioning-mode nil)
 ;; '(default-input-method "russian-computer")
 )

(setq delete-selection-mode t)

(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;;; (setq-default mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
;;; (setq mac-option-modifier 'super)
;;; (setq mac-pass-command-to-system nil)
(setq special-display-regexps (remove "[ ]?\\*[hH]elp.*" special-display-regexps))

(custom-set-faces
 '(default ((t (:background "grey90" :foreground "Black"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light))
                            (:foreground "gray50"))))
 '(org-hide ((((background light)) (:foreground "grey90")))))

;; (when (string-match "22\\." (emacs-version))
;;   (custom-set-faces
;;    '(default ((t (:stipple nil :background "grey90" :foreground "Black" :inverse-video nil
;;                            :box nil :strike-through nil :overline nil :underline nil :slant
;;                            normal :weight normal :height 160 :width normal :family
;;                            "apple-monaco"))))))

;;(when (or (string-match "23\\." (emacs-version)) (string-match "24\\." (emacs-version))))
(set-fontset-font "fontset-default" '(#x0000 . #xFFFFF) '("Apple Monaco" . "unicode-bmp"))
(setq ns-command-modifier   'meta
      ns-alternate-modifier 'super)
(setq-default cursor-type 'box)
(setq ns-antialias-text t)
(setq mac-allow-anti-aliasing t)

(setq default-frame-alist '((background-color . "grey90")
                            (left . 0)
                            (width . 130)
                            (height . 43)))
(setq initial-frame-alist (copy-alist default-frame-alist))
(setq special-display-frame-alist (copy-alist default-frame-alist))

;; erlang
(setq erlang-root-dir "/opt/local/lib/erlang")
(push "/opt/local/lib/erlang/bin" exec-path)
(setq erlang-man-root-dir "/opt/local/lib/erlang/man")

;; redefine some keys to more useful
;; (define-key osx-key-mode-map (kbd "<home>") 'beginning-of-line)
;; (define-key osx-key-mode-map (kbd "<end>") 'end-of-line)

;;
(setq special-display-regexps (remove "[ ]?\\*[hH]elp.*" special-display-regexps))
(setq special-display-regexps (remove "[ ]?\\*info.*\\*[ ]?" special-display-regexps))
(setq special-display-regexps (remove "[ ]?\\*Messages\\*[ ]?" special-display-regexps))

