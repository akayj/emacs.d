;;; package -- org mode settings
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :custom
  (org-html-validation-link nil)
  (org-todo-keywords
   '((sequence "TODO" "WORKING" "HOLD" "|" "DONE")))
  (org-todo-keyword-faces
   '(("TODO" . "blue")
     ("WORKING" . "yellow")
     ("HOLD" . "red")
     ("DONE" . "green")))
  )

(provide 'init-org)
;;; init-org.el ends here
