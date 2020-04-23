(use-package dockerfile-mode
  :ensure t
  :init
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(provide 'init-dockerfile)
;;; init-dockerfile.el ends here
