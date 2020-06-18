;;; init-rust.el -- Setup Rust mode.
;;; Commentary:
;;; Code:
(use-package rust-mode
  :ensure t
  :config
  (autoload 'rust-mode "rust-mode" nil t)

  :hook
  (rust-mode . (lambda () (setq indent-tabs-mode nil)))

  :custom
  (rust-format-on-save t)
  )

(provide 'init-rust)
;;; init-rust.el ends here
