;;; init-python.el -- support better python dev experience
;;; Commentary:

;;; Code:

;; (use-package auto-virtualenv
;;   :ensure t
;;   :init
;;   (use-package pyvenv
;;     :ensure t)
;;   :config
;;   (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
;;   (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)  ;; If using projectile
;;   )

;; (package-install 'auto-virtualenv)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)

  :config
  (require 'yapfify)
  ;; (add-hook 'python-mode-hook 'yapf-mode)
  (defun yapfify-mode-hook ()
    (require 'yapfify)
    (yapf-mode t))

  :hook
  ((python-mode .
           (lambda ()
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (setq python-indent-offset 4)
             )))

  (python-mode . yapfify-mode-hook)
  )

;; (use-package py-yapf
;;   :ensure t
;;   :hook
;;   (python-mode 'py-yapf-enable-on-save)
;;   )

(use-package pip-requirements :ensure t

  ; :hook
  ; (pip-requirements-mode #'pip-requirements-auto-complete-setup)
  )

(provide 'init-python)
;;; init-python.el ends here
