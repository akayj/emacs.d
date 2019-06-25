(setq inhibit-startup-screen t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))


;; (set-frame-font "Fira Code-13")
(set-frame-font "Inconsolata-18")

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
