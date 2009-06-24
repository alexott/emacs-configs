;;; emacs-rc-sdcv.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; (require 'sdcv-mode)
;; (global-set-key (kbd "C-c s") 'sdcv-search)

(defun kid-star-dict ()
  (interactive)
  (let ((begin (point-min))
        (end (point-max)))
    (if mark-active
        (setq begin (region-beginning)
              end (region-end))
      (save-excursion
        (backward-word)
        (mark-word)
        (setq begin (region-beginning)
              end (region-end))))
    (message "searching for %s ..." (buffer-substring begin end))
    (tooltip-show (shell-command-to-string
                   (concat "sdcv -n --utf8-output --utf8-input "
                           (buffer-substring begin end))))))
(global-set-key (kbd "C-c s") 'kid-star-dict)

;;; emacs-rc-sdcv.el ends here
