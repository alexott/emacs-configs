;;; emacs-rc-fsharp.el --- 

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet


(add-to-list 'load-path "~/projects/fsharp-mode")
(require 'fsharp-mode)
(add-to-list 'auto-mode-alist '("\\.fsi?$" . fsharp-mode))

(add-hook 'fsharp-mode-hook
					'(lambda ()
						 (local-set-key [return] 'newline-and-indent)
						 (setq fsharp-mode-lazy-= t) ; indent `=' like a standard keyword
						 (setq fsharp-mode-lazy-paren t) ; indent [({ like standard keywords
						 (setq fsharp-mode-in-indent 0) ; no indentation after `in' keywords
						 (setq fsharp-mode-font-lock-governing '("brown" "cyan" nil t t t))
																				; bold leading keywords in color mode
																				; bold-italic in font mode
						 (auto-fill-mode 1) ; turn on auto-fill minor mode
						 (if (featurep 'sym-lock)   ; Sym-Lock customization only
								 (setq sym-lock-mouse-face-enabled nil)) ; turn off special face under mouse
						 ))

(if (featurep 'sym-lock)
    (setq fsharp-mode-sym-lock-keywords
					'(("<-" 0 1 172)
						("->" 0 1 174)
						("<=" 0 1 163)
						(">=" 0 1 179)
						("<>" 0 1 185)
						("==" 0 1 186)
						("||" 0 1 218)
						("&&" 0 1 217)
						("[^*]\\(\\*\\)\\." 1 8 180)
						("\\(/\\)\\." 1 3 184)
						("\\<_\\>" 0 3 188)
						("\\<sqrt\\>" 0 3 214)
						("\\<unit\\>" 0 3 198)
						("\\<fun\\>" 0 3 108)
						("\\<or\\>" 0 3 218)
						("\\<not\\>" 0 3 216))))


;;; emacs-rc-fsharp.el ends here
