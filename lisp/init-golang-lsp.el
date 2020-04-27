;;; package -- Setup gopls for enhance golang development.
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-defined)
  :hook (go-mode . lsp-deferred))

(defun lsp-go-install-save-hooks ()
  "Set up before-save hooks to format buffer and add/delete imports.
 Make sure you don't have other gofmt/goimports hooks enabled."
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (setq lsp-ui-sideline--code-actions nil
	lsp-ui-sideline-show-hover nil)

  ;; lsp-ui-doc
  (setq lsp-ui-doc-enable t
	lsp-ui-doc-position 'top
	lsp-ui-doc-delay 5)
  )

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; company-lsp integrates company mode completion with lsp-mode.
;; completion-at-point also works out of the box but doesn't support snippets.
(use-package company-lsp
  :ensure t
  :commands company-lsp)

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))

(provide 'init-golang-lsp)
;;; init-golang-lsp.el ends here
