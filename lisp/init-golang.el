;;; package -- Setup golang mode.
;;; Commentary:
;;; Code:

(defun go/copy-envs ()
  "Init go mode."
  (when (memq window-system '(mac ns x))
    (dolist (env '("GOPATH"))
      (unless (getenv env)
	(progn
	  (exec-path-from-shell-copy-env env)
	  (message "copy env %s => %s" env (getenv env)))
	)))
  )

(use-package exec-path-from-shell
  :ensure t
  :config
  (progn
    (setenv "SHELL" "/bin/zsh")
    (setq exec-path-from-shell-arguments '("-l"))
    (go/copy-envs)
    (exec-path-from-shell-initialize)
    )
  )


(use-package go-mode
  :ensure t
  :init
  (progn
    (defun set-tab-width ()
      "Set the tab width."
      (setq-local tab-width 4)
      (setq-local indent-tabs-mode 1))
    (add-hook 'go-mode-hook 'go-set-tab-width))

  :config
  (progn
    (add-hook 'before-save-hook 'gofmt-before-save)

    (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
    (autoload 'go-mode "go-mode" nil t)
    )

  ;; format go source code
  ;; (setq gofmt-command "goimports")
  :custom
  (gofmt-command "goreturns")
  (gofmt-args '("-local" "git.ppdaicorp.com/ops"))
  )

(use-package go-errcheck :ensure t)

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
;;; init-golang.el ends here
