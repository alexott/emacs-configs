;;; emacs-rc-octave.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(defun alexott/octave-mode-hook ()
  )
(add-hook 'octave-mode-hook 'alexott/common-hook)
(add-hook 'octave-mode-hook 'alexott/common-prog-hook)
(add-hook 'octave-mode-hook 'alexott/octave-mode-hook)

;;; emacs-rc-octave.el ends here
