;;; init-gui-frames.el -- setup gui related default configurations

;;; Commentary:

;;; Code:
(setq inhibit-startup-screen t)

(defconst *is-macos* (memq window-system '(ns x)))
(defconst *laptop-env* (if (string-prefix-p "PPD-" (system-name)) 'work 'home))
(setplist 'my/font-size '(home 14 work 15))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (unless *is-macos*
    (menu-bar-mode -1)))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(set-frame-font (format "Jetbrains Mono-%d" (get 'my/font-size *laptop-env*)))
;; (set-frame-font "DejaVu Sans Mono-14")
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
