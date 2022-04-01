(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (setq company-backends '((company-capf company-dabbrev-code)))

  )

(provide 'init-company-mode)
;;; init-company-mode.el ends here
