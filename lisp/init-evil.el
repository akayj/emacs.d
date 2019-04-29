(use-package evil
  :ensure t
  :init
  (add-to-list 'load-path "~/.emacs.d/packages/evil")
  :config
  (evil-mode 1))

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
;; init-evil.el ends here
