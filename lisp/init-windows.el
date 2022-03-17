(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

;; transpancy windows
(set-frame-parameter (selected-frame) 'alpha (list 85 50))

(provide 'init-windows)
;;; init-windows.el ends here
