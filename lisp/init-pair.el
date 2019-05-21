(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'go-mode-hook #'smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'js-mode-hook #'smartparens-mode)
  (add-hook 'python-mode-hook #'smartparens-mode)
  (add-hook 'css-mode-hook #'smartparens-mode)
  (add-hook 'c-mode-hook #'smartparens-mode)
  (add-hook 'c++-mode-hook #'smartparens-mode)
  (add-hook 'java-mode-hook #'smartparens-mode)
  (add-hook 'html-mode-hook #'smartparens-mode)
  )

(provide 'init-pair)
;; init-pair.el ends here.
