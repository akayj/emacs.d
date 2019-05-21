(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )

(provide 'init-flycheck)
;;; init-flycheck.el ends here
