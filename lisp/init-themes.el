(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (require 'color-theme-sanityinc-tomorrow)
  (color-theme-sanityinc-tomorrow--define-theme bright))

(defun reapply-themes ()
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-themes)
;; init-themes.el ends here
