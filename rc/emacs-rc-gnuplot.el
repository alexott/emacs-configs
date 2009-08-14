;;; emacs-rc-gnuplot.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/gnuplot")
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

(add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))

;;; emacs-rc-gnuplot.el ends here
