;;; init-python.el -- support better python dev experience
;;; Commentary:

;;; Code:

(use-package elpy
  :ensure t
  :defer t
  :init
  ;; (advice-add 'python-mode :before 'elpy-enable)

  :hook
  (python .
	  (lambda ()
	    (setq tab-width 4)
	    (setq indent-tabs-mode t)
	    (setq python-indent-offset 4)
	    ))
  )

(use-package pip-requirements :ensure t

  ; :hook
  ; (pip-requirements-mode #'pip-requirements-auto-complete-setup)
  )

(provide 'init-python)
;;; init-python.el ends here
