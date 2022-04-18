;;; init-themes.el -- custom themes  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Author: askingyj@gmail.com

;;; Code:
(install-missing-package
 '(monokai-theme
   solarized-theme
   srcery-theme
   zenburn-theme
   dracula-theme
   material-theme))

(use-package modus-themes
  :ensure
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) 		;; OR (modus-theme-load-vivendi)
  :bind ("<f5>" . module-themes-toggle)
  )

;; Sample usage
;; (load-theme 'solarized-light t)

;; Day hour (8:00)
(defvar toggled-hours-day 8)
(defvar toggled-minute-day 0)

;; Night hour(18:00)
(defvar toggled-hours-night 18)
(defvar toggled-minute-night 0)

;; daylight theme
;; (defvar toggled-themes-day nil)
;; (defvar toggled-themes-day 'solarized-light)
;; (defvar toggled-themes-day 'monokai)
;; (defvar toggled-themes-day 'material-light)
(defvar toggled-themes-day 'modus-operandi)

;; night theme
;; (defvar toggled-themes-night 'material)
;; (defvar toggled-themes-night 'solarized-dark)
;; (defvar toggled-themes-night 'monokai)
;; (defvar toggled-themes-night 'srcery)
(defvar toggled-themes-night 'modus-vivendi)

;; `M-x list-colors-display'
;; (set-face-foreground 'font-lock-string-face "dark red")
;; (set-face-foreground 'font-lock-comment-face "gray")

(defun time-to-stamp (time-alist)
  "Parse TIME-ALIST hour minute list to float style."
   (+ (* 60 (car time-alist)) (nth 1 time-alist)))

(defun daylight-p (start-time end-time)
  "Check current time is at daylight, or night.
Return t if START-TIME <= now <= END-TIME, otherwise nil."
  (let* ((start_t (time-to-stamp start-time))
	 (end_t (time-to-stamp end-time))
	 (now (decode-time (current-time)))
	 (now_t (time-to-stamp (list (nth 2 now) (nth 1 now)))))
    (and (>= now_t start_t)
	 (< now_t end_t)))
  )

(defun next-theme (day-theme night-theme)
  "Toggle theme to DAY-THEME when in daylight, otherwise NIGHT-THEME."
  (put 'change-theme 'last-check (format-time-string "%Y-%m-%d %H:%M:%S"))

  (let* ((is-day (daylight-p (list toggled-hours-day toggled-minute-day)
			     (list toggled-hours-night toggled-minute-night)))
	 (target-theme (if is-day day-theme night-theme))
	 (current-theme (car custom-enabled-themes)))
    (unless (eq current-theme target-theme)
      ;; allow set theme to `nil'.
      (if target-theme
	  (load-theme target-theme t)
	(mapc 'disable-theme custom-enabled-themes))
      (message "[%s] %s on, smooth swith from %s to %s"
	       (format-time-string "%Y-%m-%d %H:%M:%S")
	       (if is-day "daylight" "night") current-theme target-theme))))

;;;###autoload
(defun change-theme (interval)
  "Change theme run `next-theme' in every INTERVAL seconds.
Smart delay in the first time."
  (interactive "p")
  (when (get 'change-theme 'started)
    (error (format "Already started, last check: %s" (get 'change-theme 'last-check))))

  (put 'change-theme 'started t)
  (put 'change-theme 'last-check (format-time-string "%Y-%m-%d %H:%M:%S"))

  (next-theme toggled-themes-day toggled-themes-night)

  (let* ((now-secs (car (decode-time (current-time))))
	 (delay-secs (- 60 now-secs)))
	(message "next-theme hoc check in %d secs" delay-secs)
	(run-with-timer delay-secs interval
			'next-theme toggled-themes-day toggled-themes-night))
  )

;; (change-theme 60)

(provide 'init-themes)
;;; init-themes.el ends here
