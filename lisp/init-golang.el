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
  (setq gofmt-args '("-local" "git.dianpingoa.com/dpop-app"))
  (add-hook 'before-save-hook #'gofmt-before-save)

  (add-hook 'go-mode-hook #'go-guru-hl-identifier)
  (add-hook 'go-mode-hook (lambda ()
			    (setq tab-width 4)
			    (setq indent-tabs-mode 1))))

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

;; ElDoc
(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(provide 'init-golang)
;; init-golang.el ends here.
