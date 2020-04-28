;;; init-projectile.el -- provide jump actions between files

;;; Commentary:

;;; Code:
(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-mode +1)
  ;; (projectile-mode +1)
  ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
