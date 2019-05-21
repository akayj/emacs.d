(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-define-key 'normal go-mode-map "gd" 'godef-jump))

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; evil-escape
(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
