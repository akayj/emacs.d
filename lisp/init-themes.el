;;; init-themes.el -- custom themes

;;; Commentary:

;;; Code:
(install-missing-package
 '(monokai-theme
   solarized-theme
   srcery-theme
   zenburn-theme
   dracula-theme))

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
(defvar toggled-themes-day 'solarized-light)
;; (defvar toggled-themes-day 'monokai)

;; night theme
(defvar toggled-themes-night 'dracla)
;; (defvar toggled-themes-night 'solarized-dark)
;; (defvar toggled-themes-night 'srcery)

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
      (message "%s it's %s, change theme %s => %s"
	       (format-time-string "%Y-%m-%d %H:%M:%S")
	       (if is-day "daylight" "night") current-theme target-theme))
    )
  )

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
