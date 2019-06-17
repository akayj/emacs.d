(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"))
  :config
  (if (not (f-exists-p "~/.emacs.d/snippets"))
      (f-mkdir "~/.emacs.d/snippets"))
  (use-package yasnippet-snippets :ensure t)

  (require 'yasnippet)
  (yas-global-mode 1))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
