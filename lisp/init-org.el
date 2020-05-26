;;; package -- org mode settings
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :custom
  (org-log-done 'time)
  (org-log-done 'note)

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

  (org-directory "~/gits/org")

  :config
  ;; (evil-leader/set-key "oc" 'org-capture)

  :hook
  (org-mode . my-org-symbols)
  )

(provide 'init-org)
;;; init-org.el ends here
