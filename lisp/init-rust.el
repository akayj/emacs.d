;;; init-rust.el -- Setup Rust mode.
;;; Commentary:
;;; Code:
(install-missing-package '(rust-mode))
(use-package rust-mode
  :ensure t
  :config
  (autoload 'rust-mode "rust-mode" nil t)

  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil)))

  :custom
  (rust-format-on-save t)
  )

(use-package racer
  :ensure t

  :config
  ;; (rust-mode . #'racer-mode)
  ;; (racer-mode . #'eldoc-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)

  (evil-define-key 'normal racer-mode-map "gd" 'racer-find-definition)
  )

(provide 'init-rust)
;;; init-rust.el ends here
