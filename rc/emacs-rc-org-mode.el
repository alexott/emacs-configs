;;; emacs-rc-org-mode.el ---

;; Copyright (C) 2004 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(custom-set-variables
 '(org-startup-folded nil)
 '(org-log-done t)
 '(org-hide-leading-stars t)
 '(org-agenda-include-diary t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-include-all-todo t)
 '(org-use-property-inheritance t)
 '(org-enforce-todo-dependencies t)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-agenda-dim-blocked-tasks 'invisible)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|" "DONE(d)"
                                     "CANCELED(c)")))
 '(org-agenda-files (quote ("~/projects/OrgMode/writings.org"
                            "~/projects/OrgMode/emacs.org"
                            "~/projects/OrgMode/cf.org"
                            "~/projects/OrgMode/programming.org"
                            "~/projects/OrgMode/personal.org"
                            "~/projects/OrgMode/pinacolada.org"
                            "~/projects/OrgMode/wwpro.org"
                            "~/projects/OrgMode/mcafee.org"
                            "~/projects/OrgMode/mimetype.org"
                            "~/projects/OrgMode/openers.org"
                            ))))

(add-to-list 'load-path "~/emacs/org-mode")
(require 'org-install)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'file-coding-system-alist (cons "\\.org$"  'utf-8))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)


(defun my-org-mode-hook ()
  (local-set-key "\C-x\C-a" 'show-all)
  (imenu-add-to-menubar "Imenu")
  )
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; blorg mode
(require 'blorg)

;; on screen display
(load "~/emacs/rc/emacs-rc-osd.el")
(defun org-osd-display (min-to-app new-time msg)
  (osd-display msg msg -1 "center" "center" "Verdana 40")
  )

(setq appt-disp-window-function (function org-osd-display))
;; Update appt each time agenda opened.
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
(setq appt-display-format 'window)

;; diary setup
(require 'diary-lib)
(add-hook 'diary-display-hook 'fancy-diary-display)
(custom-set-variables
 '(diary-file "~/projects/OrgMode/diary")
 '(mark-diary-entries-in-calendar t))

;; Run once, activate and schedule refresh
(run-at-time nil 3600 'org-agenda-to-appt)
(appt-activate t)

;; link abbrevs
(add-to-list 'org-link-abbrev-alist '("emacswiki" . "http://www.emacswiki.org/cgi-bin/wiki/"))
(add-to-list 'org-link-abbrev-alist '("google" . "http://www.google.com/search?q="))
(add-to-list 'org-link-abbrev-alist '("ms-spec" . "http://localhost/~ott/data-formats-doc/Microsoft%20Specs/[%s].pdf"))

;; remember mode

(org-remember-insinuate)
(setq org-directory "~/projects/OrgMode")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(
        ("Todo" ?t "* TODO %?\n  %i\n  %a" (concat org-directory "/TODO.org") "Tasks")
        ))

;; icalendar
(autoload 'icalendar-import-buffer "icalendar"
  "Import iCalendar data from current buffer" t)

;;; emacs-rc-org-mode.el ends here
