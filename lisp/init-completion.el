(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  (ivy-mode 1)

  (use-package swiper
    :ensure t
    :config
    (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper))
  )

(provide 'init-completion)
;;; init-completion.el ends here
