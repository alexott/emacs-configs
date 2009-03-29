;;; emacs-rc-muse.el --- -*- coding: utf-8 -*-

;; Copyright (C) 2006 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords: 
;; Requirements: 
;; Status: not intended to be distributed yet

(add-to-list 'load-path "~/emacs/muse")
;;(add-to-list 'load-path "~/emacs/planner")
;;(add-to-list 'load-path "~/emacs/remember")

(require 'muse-mode)     ; load authoring mode
(require 'muse-html)     ; load publishing styles I use
(require 'muse-colors)
(require 'muse-wiki)
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-project)

(muse-derive-style "my-page-html" "html"
                   :header "~/projects/my-page-muse/header.tmpl"
                   :footer "~/projects/my-page-muse/footer.tmpl")

(muse-derive-style "my-page-pdf" "pdf"
                   :header "~/projects/my-page-muse/header.tex"
                   :footer "~/projects/my-page-muse/footer.tex")

(setq muse-project-alist
			`(("personal-notes"
				 (,@(muse-project-alist-dirs "~/projects/Muse") :default "index")
				 ,@(muse-project-alist-styles "~/projects/Muse"
																			"~/public_html/muse/personal"
																			"html"))
;;; 				("wfilter-muse"			
;;; 				 ("~/projects/wfilter/Muse" :default "index")
;;; 				 (:base "html" :path "~/public_html/muse/wfilter"))
;;; 				("squid-gsb-muse"			
;;; 				 ("~/projects/squid-gsb/Muse" :default "index")
;;; 				 (:base "html" :path "~/public_html/muse/squid-gsb"))
;;; 				("as-muse"			
;;; 				 ("~/projects/archive-system/Muse" :default "index")
;;; 				 (:base "html" :path "~/public_html/muse/archive-system"))
				("my-page-project"
				 (,@(muse-project-alist-dirs "~/projects/my-page-muse") :default "index")
				 ,@(muse-project-alist-styles "~/projects/my-page-muse"
																			"~/projects/my-page-muse"
																			"my-page-html")
				 (:base "my-page-pdf"
                :path "~/projects/my-page-muse/en"
								:include "/alexott-cv-en[^/]*$")
				 (:base "my-page-pdf"
                :path "~/projects/my-page-muse/ru"
								:include "/alexott-cv-ru[^/]*$"))
				))

(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))

;;(add-to-list 'file-coding-system-alist (cons "/Muse/"  'utf-8))
(add-to-list 'file-coding-system-alist (cons "/my-page-muse/"  'utf-8))
(add-to-list 'file-coding-system-alist (cons "\\.muse$"  'utf-8))

(defun muse-gen-relative-name (name)
	(concat
	 (file-name-directory (muse-wiki-resolve-project-page (muse-project)))
	 name))

(custom-set-variables
 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-meta-content-encoding (quote utf-8))
 '(muse-html-charset-default "utf-8")
 '(muse-file-extension "muse")
 '(muse-mode-auto-p nil)
 '(muse-wiki-allow-nonexistent-wikiword nil)
 '(muse-wiki-use-wikiword nil)
 '(muse-html-footer "~/emacs/muse/templates/footer.html")
 '(muse-html-header "~/emacs/muse/templates/header.html")
 '(muse-latex-footer "~/emacs/muse/templates/footer.tex")
 '(muse-latex-header "~/emacs/muse/templates/header.tex")
 '(muse-html-style-sheet
	 "<link rel=\"stylesheet\" type=\"text/css\" charset=\"utf-8\" media=\"screen,projection\" href=\"web.css\">
    <link rel=\"stylesheet\" type=\"text/css\" href=\"print.css\" media=\"print\">")
 '(muse-ignored-extensions (quote ("bz2" "gz" "[Zz]" "rej" "orig" "png" "hgignore" "gif"
																	 "css" "jpg" "html" "sh" "lftp" "pdf")))
)

(defun my-muse-mode-hook ()
  (setq auto-fill-mode t)
	(footnote-mode 1)
	(local-set-key "\C-c:" 'uncomment-region)
	(local-set-key "\C-c;" 'comment-region)
	(local-set-key "\C-c\C-c" 'comment-region)
  )
(add-hook 'muse-mode-hook 'my-muse-mode-hook)
(add-hook 'muse-mode-hook 'turn-on-flyspell)

;;;;; for my page

; variable buffer-file-name - contain name of the current buffer

(setq my-page-menu '(("ru" . (
															 ("index.html" . "Главная")
															 ("cf/" . "Информационная безопасность")
															 ("fp/" . "Функциональное программирование")
															 ("scheme/" . "Scheme")
															 ("lisp/" . "Lisp")
															 ("erlang/" . "Erlang")
															 ("cpp/" . "C++")
															 ("oss/" . "Open Source Projects")
															 ("emacs/" . "Emacs")
															 ("writings/" . "Статьи")
															 ("macosx/" . "Mac OS X")
															 ("news/" . "Новости")
;;; ("" . "")
;;; ("" . "")
															 ))
										 ("en" . (
															 ("index.html" . "Main")
															 ("cf/" . "Information Security")
															 ("fp/" . "Functional programming")
;;;															 ("lisp/" . "Lisp")
															 ("cpp/" . "C++")
															 ("oss/" . "Open Source Projects")
															 ("emacs/" . "Emacs")
															 ("writings/" . "Articles")
															 ("news/" . "Site news")
;;;															 ("" . "")
															 ))
										 ))

(defun muse-mp-detect-language ()
	(let ((lang "NN")
				(cur-dir (file-name-directory (muse-current-file)))
				)
		(let ((smatch (string-match "/\\(ru\\|en\\|de\\)/" cur-dir)))
			(when smatch
				(setq lang (substring cur-dir (+ smatch 1) (+ smatch 3)))))
		lang))

(defun muse-mp-generate-menu ()
	(let* ((menu-lang (muse-mp-detect-language))
				 (menu-struct (assoc menu-lang my-page-menu))
				 (menu-string "")
				 (rel-dir (file-name-directory (muse-wiki-resolve-project-page (muse-project))))
				 (rel-path (if (> (length rel-dir) 2)	 (substring rel-dir 3) ""))
				 (cur-path-muse (muse-current-file))
				 (cur-path-html (replace-regexp-in-string "\\.muse" ".html" cur-path-muse))
				 )
			(when menu-struct
				(let ((menu-list (if (not (null menu-struct)) (cdr menu-struct))))
					(setq menu-string
								(concat "<ul class=\"avmenu\">"
												(apply #'concat 
															 (mapcar
																(lambda (x)
																	(concat "<li><a href=\"" rel-path (car x)
																					(if (string-match (concat "/" menu-lang "/" (car x))
																														cur-path-html)
																							"\" class=\"current\""
																						"\"")
																					">" (cdr x) "</a></li>"))
																menu-list))
												"</ul>"))))
			menu-string))


;;;;; for docbook quick-conversion

(setq my-muse-docbook-replacements
			'(
				("</?para>" . "")
				("</?section>" . "")
				("</?orderedlist>" . "")
				("</?itemizedlist>" . "")
				("</?glossdef>" . "")
				("</?glossentry>" . "")
				("</?glosslist>" . "")
				("&mdash;" . " -- ")
				("&EMACS;" . "Emacs")
				("&GNUEMACS;" . "GNU Emacs")
				("&XEMACS;" . "XEmacs")
				("<quote>\\([^<]*\\)</quote>" . "\"\\1\"")
 				("<ulink\\s *url=\"\\([^\"]*\\)\">\\([^<]*\\)</ulink>" . "[[\\1][\\2]]")
 				("<filename>\\([^<]*\\)</filename>" . "=\\1=")
 				("<command>\\([^<]*\\)</command>" . "=\\1=")
 				("<option>\\([^<]*\\)</option>" . "=\\1=")
 				("<varname>\\([^<]*\\)</varname>" . "=\\1=")
 				("<application>\\([^<]*\\)</application>" . "*\\1*")
				("<literal>\\([^<]*\\)</literal>" . "=\\1=")
				("<keycap>\\([^<]*\\)</keycap>" . "=\\1=")
				("<function>\\([^<]*\\)</function>" . "=\\1=")
				("^\\s *<title[^>]*>\\([^<]*\\)</title>" . "* \\1")
				("<acronym>\\([^<]*\\)</acronym>" . "*\\1*")
				("<keycombo>\\s *<keysym>\\([^<]*\\)</keysym>\\s *<keysym>\\([^<]*\\)</keysym>\\s *</keycombo>" . "\\1-\\2")
				("<keysym>\\([^<]*\\)</keysym>" . "\\1")
				("<computeroutput>\\([^<]*\\)</computeroutput>" . "=\\1=")
				("<emphasis>\\([^<]*\\)</emphasis>" . "*\\1*")
				("<glossterm>\\([^<]*\\)</glossterm>" . "\\1 :: ")
				;;  				("<>\\([^<]*\\)</>" . "\\1")
				;;  				("<>\\([^<]*\\)</>" . "\\1")
 				("<screen>" . "<src lang=\"emacs-lisp\">")
 				("</screen>" . "</src>")
				("&lt;" . "<")									;
				("&gt;" . ">")
				("&amp;" . "&")
				("^\\s *<listitem>" . " - ")
				("&nbsp;" . " ")
				("</listitem>" . "")
				("&quot;" . "\"")									
				;; 				("" . "")
				;; 				("" . "")
				("&PSGML;" . "*PSGML*")
				("&NXML;" . "*nXML*")
				("&RCS;" . "*RCS*")
				("&VSS;" . "*Visual SourceSafe*")
				("&CVS;" . "*CVS*")
				("&MCVS;" . "*MetaCVS*")
				("&SCCS;" . "*SCCS*")
				("&GNUARCH;" . "*GNU Arch*")
				("&BAZAAR;" . "*Bazaar*")
				("&SUBVERSION;" . "*Subversion*")
				("&DARCS;" . "*Darcs*")
				("&CLEARCASE;" . "*ClearCase*")
				("&SOURCESAFE;" . "*SourceSafe*")
				("&BITKEEPER;" . "*BitKeeper*")
				("&AEGIS;" . "*Aegis*")
				("&PERFORCE;" . "*Perforce*")
				("&MONOTONE;" . "*Monotone*")
				("&GIT;" . "*Git*")
				("&DVC;" . "*dvc*")
				("&BAZAARNG;" . "*Bazaar-NG*")
				("&MERCURIAL;" . "*Mercurial*")
				("&MERCURIALEL;" . "*mercurial.el*")
				("&VC;" . "*VC*")
				("&DVC;" . "*DVC*")
				("&P4;" . "*p4*")
				("&BK;" . "*bk*")
				("&CLEARCASEEL;" . "*clearcase*")
				("&PCLCVS;" . "*PCL-CVS*")
				("&XTLA;" . "*xtla*")
				("&DARCSUM;" . "*darcsum*")
				("&PSVN;" . "*PSVN*")
				("&SSEL;" . "*source-safe.el*")
				("&AEGISMODE;" . "*aegis-mode*")
				("&MONOTONEEL;" . "*monotone.el*")
				("&GITEL;" . "*git.el*")
				("&ELGYACH;" . "*ElGyach*")
				("&TNT;" . "*TNT*")
				("&JABBEREL;" . "*Jabber.el*")
				("&ERC;" . "*Erc*")
				("&RCIRC;" . "*Rcirc*")
				("&EDIFF;" . "*Ediff*")
				("&EMERGE;" . "*Emerge*")
				("&GNUS;" . "*Gnus*")
				("&RMAIL;" . "*Rmail*")
				("&MAILCRYPT;" . "*Mailcrypt*")
				("&SUPERCITE;" . "*Supercite*")
				("&AUCTEX;" . "*AUCTeX*")
				("&TEXMODE;" . "*TeX-mode*")
				("&REFTEX;" . "*RefTeX*")
				("&PLATEX;" . "*Preview-LaTeX*")
				("&BIBTEXMODE;" . "*bibtex*")
				("&ITE;" . "*iTe*")
				("&YATEX;" . "*yatex*")
				("&XSYMBOL;" . "*X-Symbol*")
				("&LSYMBOLS;" . "*latex-symbols*")
				("&WHIZZYTEX;" . "*WhizzyTeX*")
				("&TEX;" . "TeX")
				("&LATEX;" . "LaTeX")
				))

(defun my-muse-replace-text (from to)
	(save-excursion
		(while (re-search-forward from nil t)
			(save-restriction
				(narrow-to-region (match-beginning 0) (match-end 0))
				(replace-match to t)))))

(defun my-muse-convert-docbook ()
	(interactive)
	(mapcar (lambda (x) (my-muse-replace-text (car x) (cdr x)))
					my-muse-docbook-replacements))

;; ------------------------------------------------------------------------------------------
;; implementation of additional tags

(add-to-list 'muse-publish-markup-tags '("div" t t t muse-publish-div-tag))
(defalias 'muse-publish-div-tag 'ignore)
						 
(defun muse-html-div-tag (beg end attrs)
	(let ((id (cdr (assoc "id" attrs)))
				(style (cdr (assoc "style" attrs))))
		(when (or id style)
			(goto-char beg)
			(if (null id)
					(muse-insert-markup "<div style=\"" style "\">")
				(muse-insert-markup "<div id=\"" id "\">"))
			(save-excursion
				(goto-char end)
				(muse-insert-markup "</div>")))))

(add-to-list 'muse-html-markup-tags '("div" t t t muse-html-div-tag))

(defun compare-mod-times (f1 f2)
	"compare two file modification time and return -1, 0 or 1 if first time
is less, equal or greater then second"
	(let ((f1-h (car f1))
				(f1-l (cadr f1))
				(f2-h (car f2))
				(f2-l (cadr f2)))
		(cond
		 ((< f1-h f2-h) -1)
		 ((> f1-h f2-h) 1)
		 (t
			(cond
			 ((< f1-l f2-l) -1)
			 ((> f1-l f2-l) 1)
			 (t 0))))))

;; hook to publish blorg pages
;; TODO: restore windows positions and so on
(defun my-blorg-publish-file (fname)
	(save-excursion
		(when (file-exists-p fname)
			(let* ((cb (current-buffer))
						 (test-name (concat (file-name-directory fname) "index.html"))
						 (fname-mod (nth 5 (file-attributes fname)))
						 (test-mod (if (file-exists-p test-name)
													 (nth 5 (file-attributes test-name))
												 (list 0 0))))
				(message "%s %s" fname test-name)
				(when (or
							 (not (file-exists-p test-name))
							 (= (compare-mod-times fname-mod test-mod) 1))
					(find-file fname)
					(blorg-publish t)
					(kill-buffer (current-buffer))
					(pop-to-buffer cb))))))

(defun muse-mp-publish-hook (data)
	(if (string-equal (car data) "my-page-project")
			(progn
				(my-blorg-publish-file "~/projects/my-page-muse/ru/news/news.org")
				(my-blorg-publish-file "~/projects/my-page-muse/en/news/news.org"))))
(add-hook 'muse-after-project-publish-hook 'muse-mp-publish-hook)

;; command to fix links in blorg-generated files
;; for i in *.html *.xml ; do sed -i -e 's|\[\[\([^]]*\)\]\[\([^]]*\)\]\]|<a href="\1">\2</a>|' -- $i ; done

;;; emacs-rc-muse.el ends here
