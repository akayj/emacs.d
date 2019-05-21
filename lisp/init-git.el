(use-package magit-filenotify
  :ensure t)

(use-package magit
  :ensure t
  :init
  (custom-add-option 'magit-status-mode-hook #'magit-filenotify-mode)
  (setq magit-last-seen-setup-instructions "1.4.0")

  :config
  (global-set-key (kbd "C-c m") 'magit-status)
  (global-set-key (kbd "C-c l") 'magit-log-buffer-file)
  )

(provide 'init-git)
;; init-git.el ends here.
