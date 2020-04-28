;; (use-package anzu
;;   :ensure t
;;   :config
;;   (global-anzu-mode +1)
;;   (setq anzu-cons-mode-line-p nil))

;; (use-package diminish
;;   :ensure t
;;   :defer t)

;; (use-package spaceline
;;   :ensure t

;;   :init
;;   (setq powerline-default-separator 'slant)

;;   :config
;;   (spaceline-emacs-theme)
;;   (spaceline-toggle-minor-modes-off)
;;   ;; (spaceline-toggle-evil-state-on)
;;   (spaceline-toggle-buffer-size-off)
;;   (spaceline-toggle-evil-state-on))

(use-package doom-modeline
  :ensure t
  :hook
  (after-init . doom-modeline-mode)

  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (set-face-attribute 'mode-line nil :family "Menlo" :height 125)
  (set-face-attribute 'mode-line-inactive nil :family "Menlo" :height 125)

  (setq doom-modeline-icon (display-graphic-p))
  ;; (setq doom-modeline-major-mode-icon t)
  ;; (setq doom-modeline-buffer-state-icon t)

  ;; display the environment version.
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-go t)

  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-lsp t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-project-detection 'project)
  (doom-modeline-def-modeline 'my-simple-line
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes input-method buffer-encoding major-mode process vcs checker))

  (defun setup-custom-doom-modeline ()
    (doom-modeline-set-modeline 'my-simple-line))

  (add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
  )

(use-package all-the-icons :ensure t)


(provide 'init-powerline)
;;; init-powerline.el ends here
