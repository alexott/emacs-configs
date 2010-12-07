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

(add-hook 'cmake-mode-hook 'alexott/common-hook)
(add-hook 'cmake-mode-hook 'alexott/common-prog-hook)

;;; emacs-rc-cmake.el ends here
