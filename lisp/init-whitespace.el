;;; init-whitespace.el --  trailing space indentify

;;; Commentary:

;;; Code:
(setq-default show-trailing-whitespace t)

(use-package whitespace-cleanup-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-whitespace-cleanup-mode))

(provide 'init-whitespace)
;;; init-whitespace.el ends here
