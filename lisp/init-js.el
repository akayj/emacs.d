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

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

  ;; :hook
  ;; (web-mode . (lambda ()
  ;;		(when (string-equal "tsx" (file-name-extension buffer-file-name))
  ;;		  (setup-tide-mode))))
  )

;;;###autoload
(defun setup-tide-mode ()
  "Setup web-mode."
  (tide-setup)
  (tide-hl-identifier-mode)

  ;; evil keys
  (evil-define-key 'normal tide-mode-map "gd" 'tide-jump-to-definition)
  (evil-define-key 'normal tide-mode-map "gb" 'tide-jump-back)
  )

(use-package vue-mode
  :ensure t

  :config
  ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
  (setq mmm-submode-decoration-level 0)
  )

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  ;; :config

  :hook ((typescript-mode . setup-tide-mode)
	 (before-save . tide-format-before-save)))

(provide 'init-js)
;;; init-js.el ends here
