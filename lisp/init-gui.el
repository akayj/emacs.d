;;; init-gui.el -- setup gui related default configurations

;;; Commentary:

;;; Code:
(setq inhibit-startup-screen t)

(defconst *is-macos* (memq window-system '(ns x)))
(defconst *is-win* (memq window-system '(w32)))
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

(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(if (display-graphic-p)
    (my/frame-recenter))

;; (defvar my/frame-font-family "Cascadia Code PL")
(defvar my/frame-font-family "Jetbrains Mono")
;; (defvar my/frame-font-family "Fira Code")

;; (set-frame-font "DejaVu Sans Mono-14")
;; (set-frame-font "Fira Code-14")
;; (set-frame-font "Inconsolata-18")
;; (set-frame-font "Jetbrains Mono-12")
;; (set-frame-font "Cascadia Code PL-14")

;; 修复中文显示问题
(if (functionp 'set-fontset-font)
    (set-fontset-font "fontset-default"
		      'gb18030 '("MiSans" . "unicode-bmp"))
		      ;; 'gb18030 '("PingFang SC" . "unicode-bmp"))
  )

(defvar my/frame-font-size
  (cond
   ((and (equal *laptop-env* "home") *is-win*) 12)
   ((and (equal *laptop-env* "home") *is-macos* 14))
   ((and (equal *laptop-env* "work") *is-macos* 15))
   ))

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
