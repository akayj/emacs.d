;;; init-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:

;; (setq mode-line-format '("%e"))
      ;; '(
      ;;	))

(defvar mode-line-cleaner-alist
  `(
    (auto-complete-mode . 945) ;; α
    (yas-minor-mode . 9422)
    (paredit-mode . nil)
    (eldoc-mode . nil)
    (abbrev-mode . nil)
    (auto-revert-mode . nil)

    (counsel-mode . nil)
    (flycheck-mode . 9403)

    ;; Major modes
    (lisp-interaction-mode . 955) ;; λ
    (hi-lock-mode . nil)
    ;; (python-mode . "Py")
    (python-mode . 128013)
    (go-mode . 128063)

    (emacs-lisp-mode . 8721)
    (nxhtml-mode . "nx")

    (helm-mode . 9405)
    (company-mode . 9426)

    (undo-tree-mode . nil)

    (smartparens-mode . nil)
    (whitespace-cleanup-mode . nil)

    (ivy-mode . nil)
    (evil-escape-mode . nil)
    (evil-commentary-mode . nil)
    )
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (dolist (cleaner mode-line-cleaner-alist)
    (let* ((mode (car cleaner))
	   (mode-val (cdr cleaner))
	   (mode-str (if (numberp mode-val) (char-to-string mode-val) mode-val))
	   (old-mode-str (cdr (assq mode minor-mode-alist))))
      (when old-mode-str
	(setcar old-mode-str (if mode-str (format " %s" mode-str) "")))
      ;; major mode
      (when (eq mode major-mode)
	(setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

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

;; (use-package doom-modeline
;;   :ensure t
;;   :hook
;;   (after-init . doom-modeline-mode)

;;   :config
;;   (setq doom-modeline-height 25)
;;   (setq doom-modeline-bar-width 3)
(set-face-attribute 'mode-line nil :family "Menlo" :height 125)
(set-face-attribute 'mode-line-inactive nil :family "Menlo" :height 125)

;;   (setq doom-modeline-icon (display-graphic-p))
;;   ;; (setq doom-modeline-major-mode-icon t)
;;   ;; (setq doom-modeline-buffer-state-icon t)

;;   ;; display the environment version.
;;   (setq doom-modeline-env-enable-python t)
;;   (setq doom-modeline-env-enable-go t)

;;   (setq doom-modeline-major-mode-color-icon t)
;;   (setq doom-modeline-lsp t)
;;   (setq doom-modeline-enable-word-count t)
;;   (setq doom-modeline-project-detection 'project)
;;   (doom-modeline-def-modeline 'my-simple-line
;;     '(bar matches buffer-info remote-host buffer-position parrot selection-info)
;;     '(misc-info minor-modes input-method buffer-encoding major-mode process vcs checker))

;;   (defun setup-custom-doom-modeline ()
;;     (doom-modeline-set-modeline 'my-simple-line))

;;   (add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
;;   )

;; (use-package all-the-icons :ensure t)


(provide 'init-modeline)
;;; init-modeline.el ends here
