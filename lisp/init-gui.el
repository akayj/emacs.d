;;; init-gui.el -- setup gui related default configurations

;;; Commentary:

;;; Code:
(setq inhibit-startup-screen t)

(defconst *is-macos* (memq window-system '(ns x)))
(defconst *laptop-env*
  (if (string-prefix-p "PPD-" (system-name))
      "work" "home"))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'menu-bar-mode)
  (unless *is-macos*
    (menu-bar-mode -1)))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (width . 96)
	      (height . 50)
	      (left . 50)
	      ;; (top . 50)
	      ))))

(defvar my/frame-font-family "Cascadia Code PL")
;; (defvar my/frame-font-family "Jetbrains Mono")
;; (set-frame-font "DejaVu Sans Mono-14")
;; (set-frame-font "Fira Code-13")
;; (set-frame-font "Inconsolata-18")

;; 修复中文显示问题
(if (featurep 'set-fontset-font)
(set-fontset-font "fontset-default"
		  'gb18030 '("PingFang SC" . "unicode-bmp"))
 )

(defvar my/frame-font-size
  (cond
   ((equal *laptop-env* "home") 14)
   ((equal *laptop-env* "work") 15)))

(defvar my/frame-font
  (format "%s-%d"
	  my/frame-font-family
	  my/frame-font-size))


(set-frame-font my/frame-font)

(blink-cursor-mode 0)

(setq-default line-spacing 0.25)

;; (add-to-list 'default-frame-alist '(fullscreen . maximize-window))

;; line number (version must >= 26)
(when (version<= "26" emacs-version)
  (global-display-line-numbers-mode))

(when (fboundp 'windmove-default-keybindings)
  ;; Shift-{Left,Right,Up,Down}
  (windmove-default-keybindings))

(use-package dimmer
  :ensure t
  :config
  (dimmer-configure-which-key)
  (dimmer-configure-helm)
  (dimmer-mode t))

(provide 'init-gui)
;;; init-gui.el ends here
