(use-package all-the-icons :ensure t)

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
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
