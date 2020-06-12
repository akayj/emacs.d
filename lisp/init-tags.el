;;; init-tags.el -- ctags/etags config
;;; Code:
;;; Commentary:

(defun create-tags (dir-name)
  "Create tags file for DIR-NAME with ETags."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name '*.[ch]' | etags -" dir-name)))

(provide 'init-tags)
;;; init-tags.el ends here
