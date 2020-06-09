;;; init-todo.el --  hl todo keywords

;;; Commentary:

;;; Code:
(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode +1)

  :custom
  (hl-todo-keyword-faces
   '(("TODO" . "#FF0000")
     ("FIXME" . "#FF0000")
     ("DEBUG"  . "#A020F0")
     ("GOTCHA" . "#FF4500")
     ("STUB"   . "#1E90FF")))
  )

(provide 'init-todo)
;;; init-todo.el ends here
