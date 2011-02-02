;;; emacs-rc-scala.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet


(defun alexott/scala-mode-hook ()
  (setq indent-tabs-mode nil)
  
  )
(add-hook 'scala-mode-hook 'alexott/scala-mode-hook)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; TODO: add setting of 
;; https://github.com/aemoncannon/ensime
;; https://github.com/RayRacine/scallap

;;; emacs-rc-scala.el ends here
