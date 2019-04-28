(use-package evil
  :init
  (add-to-list 'load-path "~/.emacs.d/packages/evil")
  :ensure t
  :config
  (evil-mode 1))

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
;; init-evil.el ends here
