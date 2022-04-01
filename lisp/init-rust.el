;;; init-rust.el -- Setup Rust mode.
;;; Commentary:
;;; Code:

(defun rk/rustic-mode-hook ()
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))

(use-package rustic
  :ensure t
  ;; :requires eglot

  :custom
  (rustic-format-on-save t)

  :config
  ;; less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  ;; (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)

  ;; (add-hook 'rustic-mode-hook 'eglot-ensure)

  ;; (require 'lsp-rust)
  ;; (setq lsp-rust-analyzer-completion-add-call-parenthesis nil)
  )

;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp
;;   :custom
;;   (lsp-rust-analyzer-cargo-watch-command "clippy")
;;   (lsp-eldoc-render-all t)
;;   (lsp-idle-delay 0.6)
;;   ;; enable / disable the hints as your prefer:
;;   (lsp-rust-analyzer-server-display-inlay-hints t)
;;   (lsp-rust-analyzer-inlay-hints-mode t)
;;   (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
;;   (lsp-rust-analyzer-display-closure-return-type-hints t)
;;   (lsp-rust-analyzer-display-parameter-hints nil)
;;   (lsp-rust-analyzer-display-reborrow-hints nil)

;;   :hook
;;   (lsp-mode . 'lsp-ui-mode)
;;  )

;; (use-package lsp-ui
;;   :ensure
;;   :commands lsp-ui-mode
;;   :custom
;;   (lsp-ui-peek-always-show t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-doc-enable nil)
;;   )

;; (add-hook 'before-save-hook
;; 	  (lambda ()
;; 	    (when (eq major-mode 'rustic-mode)
;; 	      (rustic-format-buffer))))

;; (use-package flycheck :ensure)

(provide 'init-rust)
;;; init-rust.el ends here
