;;; package -- org mode settings
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :custom
  (org-html-validation-link nil)
  (org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
     (sequence "WAITING(w@/!)" "HOLD(h@!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING")
     ))
  (org-todo-keyword-faces
   '(("TODO" :foreground "red" :weight bold)
     ("NEXT" :foreground "blue" :weight bold)
     ("DONE" :foreground "forest green" :weight bold)
     ("WAITING" :foreground "orange" :weight bold)
     ("HOLD" :foreground "magenta" :weight bold)
     ("CANCELLED" :foreground "forest green" :weight bold)
     ("MEETING" :foreground "forest green" :weight bold)
     ))

  (org-directory "~/gits/org")

  :hook
  (org-mode . my-org-symbols)
  )

(provide 'init-org)
;;; init-org.el ends here
