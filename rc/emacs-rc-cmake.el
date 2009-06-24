;;; emacs-rc-cmake.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; support for CMake
(autoload 'cmake-mode "cmake-mode" t)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(defun alexott/cmake-mode-hook ()
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\C-c\C-c" 'comment-region)
  (local-set-key "\C-u\C-c\C-c" 'uncomment-region)
  )
(add-hook 'cmake-mode-hook 'alexott/cmake-mode-hook)

;;; emacs-rc-cmake.el ends here
