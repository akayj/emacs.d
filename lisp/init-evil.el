(use-package evil
  :ensure t
  :config
  (evil-mode 1))

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

;; All the Icons
;; (use-package all-the-icons :ensure t)

(provide 'init-evil)
;; init-evil.el ends here
