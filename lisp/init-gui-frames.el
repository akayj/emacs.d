(setq inhibit-startup-screen t)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))


(set-frame-font "Jetbrains Mono-15")
;; (set-frame-font "Fira Code-13")
;; (set-frame-font "Inconsolata-18")

(blink-cursor-mode 0)

(setq-default line-spacing 0.25)

(add-to-list 'default-frame-alist '(fullscreen . maximize-window))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
