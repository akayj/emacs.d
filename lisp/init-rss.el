(use-package elfeed
  :ensure t

  :init
  (global-set-key (kbd "C-x w") 'elfeed)

  :config
  (setq elfeed-feeds
	'("http://feeds.feedburner.com/ruanyifeng"
	  ;; "http://nullprogram.com/feed/"
	  ;; "https://planet.emacslife.com/atom.xml"
	  )
	)

  (setf url-queue-timeout 30))

(provide 'init-rss)
;;; init-rss.el ends here
