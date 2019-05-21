(use-package abbrev
  :diminish abbrev-mode
  :init
  (if (file-exists-p abbrev-file-name)
      (quietly-read-abbrev-file)))

(provide 'init-diminish)
;;; init-diminish.el ends here
