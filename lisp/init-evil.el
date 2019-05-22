(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode t)
    (evil-define-key 'normal go-mode-map "gd" 'godef-jump)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

  :config
  (progn
    (use-package evil-leader
      :ensure t
      :init
      (progn
	(global-evil-leader-mode)
	(setq evil-leader/in-all-states 1)
	(evil-leader/set-leader "<SPC>")
	(evil-leader/set-key "c" 'compile)
	(evil-leader/set-key "f" 'ido-find-file)

	;; git
	(evil-leader/set-key "m" 'magit-status)

	;; buffer
	(evil-leader/set-key "k" 'ido-kill-buffer)
	(evil-leader/set-key "b" 'ido-switch-buffer)
	(evil-leader/set-key "s" 'save-buffer)

	;; quit
	(evil-leader/set-key "qq" 'save-buffers-kill-terminal)
      ))

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

    )
  )


(provide 'init-evil)
;;; init-evil.el ends here
