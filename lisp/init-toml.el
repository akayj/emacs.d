(use-package toml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.t[o]ml\\'" . toml-mode)))
(provide 'init-toml)
;;; init-toml.el ends here
