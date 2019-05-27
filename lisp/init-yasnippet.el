(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"))
  :init
  (require 'yasnippet)
  (yas-global-mode 1))
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
