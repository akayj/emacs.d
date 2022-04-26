;;; init-whitespace.el --  trailing space indentify and cleanup

;;; Commentary:

;;; Code:
(setq-default show-trailing-whitespace t)

(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
