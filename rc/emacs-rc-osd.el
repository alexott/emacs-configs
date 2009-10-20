;;; emacs-rc-osd.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; for linux via dbus -> http://nroff.livejournal.com/3605.html

;; rewrite to utf-8 -> byte-string
;; see also http://bbs.macscripter.net/viewtopic.php?id=20553&action=new
;; utxt --> Unicode-16, native byte order, with an optional byte-order mark (BOM).
(defun osd-text-to-utf-16-hex (text)
  (let* ((utext (encode-coding-string text 'utf-16))
         (ltext (string-to-list utext)))
    (apply #'concat
     (mapcar (lambda (x) (format "%02x" x)) ltext))))

;; тест -> feff0442043504410442
;; (osd-text-to-utf-16-hex "тест")

(defun output-to-growl (msg)
  (let ((fname (make-temp-file "/tmp/growlXXXXXX.applescript")))
    (with-temp-file fname
      (setq coding-system-for-write 'utf-16)
      (insert (format "tell application \"GrowlHelperApp\"
     notify with name \"Emacs Notification\" title \"Emacs alert\" description «data utxt%s» as Unicode text application name \"Aquamacs Emacs\"
   end tell"  (osd-text-to-utf-16-hex msg))))
    (shell-command (format "osascript %s" fname))
    (delete-file fname)))

;; osd notifications
(defun osd-display (id msg &optional delay vattrib hattrib font)
  "Display a message with an id of ID for delay seconds with message msg"
  (unless vattrib (setq vattrib "center"))
  (unless hattrib (setq hattrib "center"))
  (unless delay (setq delay 5000))
  (unless font (setq font "Serif Bold Italic 32"))

  (cond
   ((string= system-type "gnu/linux")
    (save-window-excursion
      (shell-command
       (format
        "gnome-osd-client -f \"<message id='%s' osd_fake_translucent_bg='off' osd_font='%s' animations='on' hide_timeout='%d' osd_vposition='%s' osd_halignment='%s'>%s</message>\""
        id
        font
        delay
        vattrib
        hattrib
        msg)
     nil nil)))
   ((string= system-type "darwin")
    (save-window-excursion
      (output-to-growl msg)))
   (t
    nil)))

;;; emacs-rc-osd.el ends here
