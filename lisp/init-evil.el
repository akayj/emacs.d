;;; package -- evil related settings
;;; Code:
;;; Commentary:
(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode t)
    (evil-define-key 'normal go-mode-map "gd" 'godef-jump)
    (evil-define-key 'normal go-mode-map "gb" 'xref-pop-marker-stack)
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

	;; (evil-leader/set-key "c" 'compile)
	;; (evil-leader/set-key-for-mode 'emacs-lisp-mode "c" 'byte-compile-file)

	(evil-leader/set-key
	  "n" 'neotree-toggle
	  "f" 'ido-find-file
	  ;; git
	  "m" 'magit-status
	  ;; buffer
	  "k" 'kill-this-buffer
	  "b" 'ivy-switch-buffer
	  "s" 'save-buffer
	  ;; comment/uncomment
	  ;; "cl" 'comment-line
	  ;; quit
	  "qq" 'save-buffers-kill-terminal)
      ))

    ;; evil-commentary
    (use-package evil-commentary
      :ensure t
      :config
      (evil-commentary-mode))

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
