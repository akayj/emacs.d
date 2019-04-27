(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))


(set-default-font "Fira Code-14")

(provide 'init-gui-frames)
;; init-gui-frames.el ends here
