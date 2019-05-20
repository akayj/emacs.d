(use-package exec-path-from-shell
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  (use-package go-errcheck :ensure t)

  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (autoload 'go-mode "go-mode" nil t)

  ;; (exec-path-from-shell-copy-env "GOPATH")
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-copy-envs '("GOPATH" "PATH"))

  ;; format go source code
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save)

  (add-hook 'go-mode-hook #'go-guru-hl-identifier))

(use-package go-autocomplete
  :ensure t
  :config
  (ac-config-default))

(use-package go-guru
  :ensure t
  :config
  (go-guru-hl-identifier-mode))

(use-package company-go
  :ensure t
  :after go
  :config
  (setq tab-width 4))

(provide 'init-golang)
;; init-golang.el ends here.
