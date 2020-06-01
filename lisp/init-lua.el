;;; init-lua -- lua support -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode)))
(provide 'init-lua)
;;; init-lua.el ends here
