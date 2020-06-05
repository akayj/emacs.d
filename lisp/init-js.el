;;; init-js.el -- setting for Javascript/Typescript
;;; Commentary:
;;; Code:
(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

  :hook
  (js2-mode . my-add-pretty-lambda))

(use-package tern :ensure t)

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :config
  (define-key evil-normal-state-map (kbd "gd") 'tide-jump-to-definition)
  (define-key evil-normal-state-map (kbd "gb") 'tide-jump-back)

  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save)))

(provide 'init-js)
;;; init-js.el ends here
