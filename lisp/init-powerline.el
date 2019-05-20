(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1)
  (setq anzu-cons-mode-line-p nil))

(use-package diminish
  :ensure t
  :defer t)

(use-package spaceline
  :ensure t

  :init
  (setq powerline-default-separator 'slant)

  :config
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off)
  ;; (spaceline-toggle-evil-state-on)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-evil-state-on))

;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode)
;;   :config
;;   (setq doom-modeline-height 24)
;;   (setq doom-modeline-bar-width 3)
;;   (setq doom-modeline-icon t)
;;   (setq doom-modeline-buffer-state-icon t)
;;   (setq doom-modeline-env-enable-go t))


(provide 'init-powerline)
;; init-powerline.el ends here.