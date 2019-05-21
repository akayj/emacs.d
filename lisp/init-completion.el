(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

  (setq search-default-mode #'char-fold-to-regexp)
  (ivy-mode 1)

  (use-package swiper
    :ensure t
    :config
    (global-set-key "\C-s" 'swiper))
  )

(provide 'init-completion)
;; init-completion.el ends here.
