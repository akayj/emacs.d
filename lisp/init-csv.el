(use-package csv-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  (autoload 'csv-mode "csv-mode"
    "Major mode for editing comma-separated value files." t))

(provide 'init-csv)
;; init-csv.el ends here
