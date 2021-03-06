;;; init-rust.el -- Setup Rust mode.
;;; Commentary:
;;; Code:
;; (install-missing-package '(rust-mode))
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
  :requires rust-mode

  :init
  (setq racer-rust-src-path
	(concat (string-trim
		 (shell-command-to-string "rustc --print sysroot"))
		"/lib/rustlib/src/rust/src"))

  :config
  (evil-define-key 'normal racer-mode-map "gd" 'racer-find-definition)

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)

  ;; :hook
  ;; ((rust-mode . #'racer-mode)
  ;; (racer-mode . #'eldoc-mode)
  ;; (racer-mode . #'company-mode))
  )

(provide 'init-rust)
;;; init-rust.el ends here
