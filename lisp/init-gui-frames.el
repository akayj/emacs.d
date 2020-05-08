;;; init-gui-frames.el -- setup gui related default configurations

;;; Commentary:

;;; Code:
(setq inhibit-startup-screen t)

(defconst *is-macos* (memq window-system '(ns x)))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (unless *is-macos*
    (menu-bar-mode -1)))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))


;; (set-frame-font "Jetbrains Mono-14")
(set-frame-font "DejaVu Sans Mono-15")
;; (set-frame-font "Fira Code-13")
;; (set-frame-font "Inconsolata-18")

(blink-cursor-mode 0)

(setq-default line-spacing 0.25)

(add-to-list 'default-frame-alist '(fullscreen . maximize-window))

;; line number (version must >= 26)
(when (version<= "26.0" emacs-version)
  (global-display-line-numbers-mode))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
