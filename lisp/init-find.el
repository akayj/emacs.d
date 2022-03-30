;;; init-find.el -- find utilities

;;; Commentary:

;;; Code:
(use-package find-file-in-project
  :ensure t

  :config
  (setq ffip-use-rust-fd t)
  )

(provide 'init-find)
;;; init-find.el ends here
