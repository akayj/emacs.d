;;; init-find.el -- find utilities

;;; Commentary:

;;; Code:
(use-package find-file-in-project
  :ensure t

  :config
  (setq ffip-use-rust-fd t)
  )

(use-package color-moccur
  :commands (isearch-moccur isearch-all)
  :bind (("M-s O" . moccur)
         :map isearch-mode-map
         ("M-o" . isearch-moccur)
         ("M-O" . isearch-moccur-all))
  :init
  (setq isearch-lazy-highlight t)
  :config
  (use-package moccur-edit)
  )

;; (use-package ace-jump-mode
;;   :defer t
;;   :init
;;   (autoload 'ace-jump-mode "ace-jump-mode" nil t)
;;   (bind-key "C-." 'ace-jump-mode))

(use-package ace-jump-mode
  :bind ("C-." . ace-jump-mode))

(use-package avy
  :ensure t
  :bind ("C-l" . avy-goto-char-2)available)

(use-package ace-pinyin
  :ensure t
  :config
  (ace-pinyin-global-mode +1))

(provide 'init-find)
;;; init-find.el ends here
