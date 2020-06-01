;;; package -- evil related settings
;;; Code:
;;; Commentary:
(use-package evil
  :ensure t
  :init
  (progn
    (global-evil-leader-mode)
    (evil-mode t)
    (evil-define-key 'normal go-mode-map "gd" 'godef-jump)
    (evil-define-key 'normal go-mode-map "gb" 'xref-pop-marker-stack)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

  :config
  (progn
    ;; set evil tag face in modeline
    ;; (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
    (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "blue" :foreground "white")))
	  evil-emacs-state-tag    (propertize "[E]" 'face '((:background "purple1"       :foreground "white")))
	  ;; evil-emacs-state-tag    (propertize "[E]" 'face 'font-lock-function-name-face)
	  evil-insert-state-tag   (propertize "[I]" 'face '((:background "chartreuse3"    :foreground "black")))
	  evil-replace-state-tag  (propertize "[R]" 'face '((:background "chocolate"      :foreground "black")))
	  evil-motion-state-tag   (propertize "[M]" 'face '((:background "plum3"          :foreground "black")))
	  evil-visual-state-tag   (propertize "[V]" 'face '((:background "gray"           :foreground "black")))
	  evil-operator-state-tag (propertize "[O]" 'face '((:background "sandy brown"    :foreground "black"))))

    (use-package evil-leader
      :ensure t
      :init
      (progn
	(setq evil-leader/in-all-states 1)
	(evil-leader/set-leader "<SPC>")

	;; (evil-leader/set-key "c" 'compile)
	;; (evil-leader/set-key-for-mode 'emacs-lisp-mode "c" 'byte-compile-file)

	(evil-leader/set-key
	  "n" 'neotree-toggle
	  ;; "f" 'ido-find-file
	  "f" 'helm-find-files
	  ;; git
	  "m" 'magit-status
	  ;; buffer
	  "x" 'kill-this-buffer
	  "b" 'ivy-switch-buffer
	  "s" 'save-buffer

	  ;; `projectile' settings
	  "p" 'projectile-switch-project
	  "o" 'projectile-switch-open-project

	  "c" 'delete-old-pkgs
	  "e" 'elpamr-create-mirror-for-installed

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
