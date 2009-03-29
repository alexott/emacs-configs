;;; emacs-rc-local-alexott.el ---

;; erlang
(setq erlang-root-dir "/usr/lib/erlang")
(add-to-list 'exec-path "/usr/lib/erlang/bin")
(add-to-list 'exec-path "~/exp/bin")
(setq erlang-man-root-dir "/usr/lib/erlang/man")

;;
(require 'sigdb-mode)

;; cedet/semantic
(ede-cpp-root-project "Pinacolada"
                      :name "Pinacolada"
                      :file "~/work/webwasher-ng/CMakeLists.txt"
                      :include-path '("/"
                                      "/Common"
                                      "/Common/Unix"
                                      "/Interfaces"
                                      "/Openers"
                                      "/Proxy"
                                      "/RuleEngine"
                                      "/Webwasher"
                                      "/Webwasher/Unix"
                                      "/Libs/OLE2"
                                      "/Libs/MimeType"
                                      "/Libs/Sockets"
                                      "/Libs/Sockets/Unix"
                                      "/ApplicationFramework"
                                      "/Filters"
                                      "/Tests"
                                       )
                      :system-include-path '("/usr/include"
                                             "/usr/include/c++/4.3"
                                             "~/work/webwasher-ng/ExtLibs/devel/include"
                                             )
                      :spp-table '(
                                   ("swUnix" . "")
                                   ("swLinux" . "")
                                   ("BOOST_TEST_DYN_LINK" . "")
                                   )
                      :local-variables (list
                                         (cons 'compile-command  'my-gen-cmake-debug-compile-string)
                                         (cons 'semantic-lex-c-preprocessor-symbol-file
                                                                                  (list "~/work/webwasher-ng/ExtLibs/devel/include/boost/config.hpp"
                                                                                        "/usr/usr/include/c++/4.3/i486-linux-gnu/bits/c++config.h")))
                      )

(ede-cpp-root-project "webwasher"
                      :file "~/work/wwpro-head/source/Makefile"
                      :include-path '("/"
                                      "/Unix"
                                      "/Antivirus"
                                      "/FilterEngine"
                                      "/MobileCodeFilter"
                                      "/wwinspct/include"
                                      "/SSLScanner"
                                      )
                      :system-include-path '("/usr/include"
                                             "/usr/include/c++/4.3"
                                             "~/work/webwasher-ng/ExtLibs/devel/include"
                                             )
                      :spp-table '(
                                   ("swUnix" . "")
                                   ("swLinux" . "")
                                   ("swDebug" . "")
                                   )
                      :local-variables '(
                                         (compile-command . "cd ~/work/wwpro-head/source/; make install-debug BUILDSYSTEM_SHORT=debian-4.0-intel")
                                         (semantic-lex-c-preprocessor-symbol-file .
                                                                                  ("~/work/webwasher-ng/ExtLibs/devel/include/boost/config.hpp"
                      "/usr/usr/include/c++/4.3/i486-linux-gnu/bits/c++config.h"))
                                         )
                      )

;; auto-inserts
(add-to-list 'auto-insert-alist '(".*/work/.*\\.cpp$" . ["insert-work.cpp" auto-update-c-source-file]))
(add-to-list 'auto-insert-alist '(".*/work/.*\\.h$"   . ["insert-work.h" auto-update-header-file]))
(add-to-list 'auto-insert-alist '(".*/work/.*\\.c$" . ["insert-work.cpp" auto-update-c-source-file]))

;; gnus & mail
(setq nnmail-spool-file '("/var/spool/mail/ott"))
(setq gnus-posting-styles
      '(
        (".*"
;;         (Gcc "nnml:sent")
         (Organization "Alex Ott's Consulting")
         (signature-file "~/.signature")
         )
        ))

(custom-set-variables
 '(transient-mark-mode t)
 '(compile-command "make -k -j2")
 '(browse-url-browser-function (quote browse-url-firefox))
 )

(set-input-method "russian-computer" nil)

;; decoration
(add-to-list 'default-frame-alist '(font . "Consolas-13"))
(add-to-list 'default-frame-alist '(height . 43))
(add-to-list 'default-frame-alist '(width . 115))
(add-to-list 'default-frame-alist '(background-color . "grey92"))
(setq initial-frame-alist default-frame-alist)
(setq special-display-frame-alist default-frame-alist)

(custom-set-faces
 '(default ((t (:background "grey92" :foreground "black" :slant normal :weight normal :height 130 :width normal :foundry "microsoft" :family "Consolas"))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face :height 1.1))))
 '(font-latex-sectioning-5-face ((((class color) (background light)) (:foreground "blue4" :weight bold))))
 '(font-latex-verbatim-face ((((class color) (background light)) (:foreground "SaddleBrown"))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background light)) (:foreground "darkgreen"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "gray40"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background light)) (:foreground "blue4"))))
 '(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "green4"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background light)) (:foreground "blue"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background light)) (:foreground "darkred"))))
 '(jabber-chat-prompt-system ((t (:foreground "darkgreen" :weight bold))))
 '(org-hide ((((background light)) (:foreground "grey92"))))
 '(planner-completed-task-face ((t (:strike-through t)))))

;;; emacs-rc-local-alexott.el ends here
