;;; init-rust.el -- Setup Rust mode.
;;; Commentary:
;;; Code:

;; (install-missing-package '(rust-mode))

;; (use-package rust-mode
;;   :ensure t
;;   :config
;;   (autoload 'rust-mode "rust-mode" nil t)

;;   :hook
;;   (rust-mode . (lambda () (setq indent-tabs-mode nil)))

;;   :custom
;;   (rust-format-on-save t)
;;   )

;; (use-package racer
;;   :ensure t
;;   :requires rust-mode eglot

;;   :init
;;   (setq racer-rust-src-path
;; 	(concat (string-trim
;; 		 (shell-command-to-string "rustc --print sysroot"))
;; 		"/lib/rustlib/src/rust/library"))
;; 		;; "/lib/rustlib/src/rust/src"))

;;   :config
;;   (evil-define-key 'normal racer-mode-map "gd" 'racer-find-definition)

;;   (add-hook 'rust-mode-hook #'racer-mode)
;;   (add-hook 'racer-mode-hook #'eldoc-mode)
;;   (add-hook 'racer-mode-hook #'company-mode)

;;   (add-hook 'rust-mode-hook
;;           (lambda () (prettify-symbols-mode)))

;;   ;; (add-hook 'rust-mode-hook 'eglot-ensure)

;;   ;; :hook
;;   ;; ((rust-mode . #'racer-mode)
;;   ;; (racer-mode . #'eldoc-mode)
;;   ;; (racer-mode . #'company-mode))
;;   )

(defun rk/rustic-mode-hook ()
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package rustic
  :ensure t
  :requires eglot

  ;; :init
  ;; (setq rustic-format-on-save t)

  :config
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)
  (add-hook 'rustic-mode-hook 'eglot-ensure)

  ;; :hook
  ;; (rustic-mode 'rk/rustic-mode-hook)
  )

(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)

  :hook
  (lsp-mode . 'lsp-ui-mode)
 )

(add-hook 'before-save-hook
	  (lambda ()
	    (when (eq major-mode 'rustic-mode)
	      (rustic-format-buffer))))

(provide 'init-rust)
;;; init-rust.el ends here
