;;; package -- org mode settings
;;; Commentary:
;;; Code:

;; (add-to-list 'load-path (expand-file-name "org/lisp" user-emacs-directory))
;; (add-to-list 'load-path (expand-file-name "org/contrib/lisp" user-emacs-directory))

(use-package org
  ;; :ensure t
  :custom
  (org-log-done 'time)
  (org-log-done 'note)

  (org-agenda-files (list "~/agenda/myfile1.org"
		     "~/agenda/myfile2.org"))

  ;; 打开 org-indent mode
  (org-startup-indented t)
  ;; 设置 bullet list
  (org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

  (org-src-fontify-natively t)

  (org-html-validation-link nil)
  (org-todo-keywords
   '((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d)")
     (sequence "WAITING(w@/!)" "HOLD(h@!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
     ))
  (org-todo-keyword-faces
   '(("TODO" :foreground "red" :weight bold)
     ("STARTED" :foreground "white" :background "blue" :weight bold)
     ("DONE" :foreground "forest green" :weight bold)
     ("WAITING" :foreground "orange" :weight bold)
     ("HOLD" :foreground "magenta" :weight bold)
     ("CANCELLED" :foreground "forest green" :weight bold)
     ("MEETING" :foreground "forest green" :weight bold)
     ))

  (org-capture-templates
   '(("n" "Notes" entry
      (file "~/org/inbox.org") "* %^{Description} %^g\n Added: %U\n%?")
     ("m" "Meeting notes" entry
      (file "~/org/meetings.org") "* TODO %^{Title} %t\n- %?")
     ("t" "TODO" entry
      (file "~/org/inbox.org") "* TODO %^{Title}")
     ("e" "Event" entry
      (file "~/org/calendar.org") "* %^{Is it a todo?||TODO |NEXT }%^{Title}\n%^t\n%?")
     ("w" "Work TODO" entry
      (file "~/org/work.org") "* TODO %^{Title}")
     ))

  ;; (org-directory "~/gits/org")

  :config
  ;; (evil-leader/set-key "oc" 'org-capture)

  :hook
  (org-mode . my-org-symbols)
  )

(use-package org-mime :ensure t
  :hook
  ;; (org-mime-html . (lambda ()
  ;;		     (org-mime-change-element-style
  ;;		      "pre" (format "color: %s; background-color: %s; padding: 0.5em;"
  ;;				    "#E6E1DC" "#232323"))))

  (org-mime-html . (lambda ()
		     (while (re-search-forward "@\\([^@]*\\)@" nil t)
		     ;; (while (re-search-forward "@([^@]*)@" nil t)
		       (replace-match "<span style=\"color:red\">\\1</span>")))
		 )
  )

;; FIX void `org-collect-keywords' error
(org-reload)

(use-package ox-hugo
  :ensure t
  :pin melpa
  :after ox)

(provide 'init-org)
;;; init-org.el ends here
