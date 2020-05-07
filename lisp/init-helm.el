;;; init-helm.el -- provides helm package

;;; Commentary:

;;; Code:
(use-package helm
  :ensure t
  :init
  (require 'helm-config)

  :config
  (helm-mode 1))


(use-package helm-adaptive
  :config
  (setq helm-adaptive-history-file nil)
  (helm-adaptive-mode 1))

(provide 'init-helm)
;;; init-helm.el ends here
