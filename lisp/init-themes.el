;;; init-themes.el -- custom themes

;;; Commentary:

;;; Code:
(install-missing-package
 '(monokai-theme solarized-theme srcery-theme))

;; Sample usage
;; (load-theme 'solarized-light t)

;; Day hour (8:00)
(defvar toggled-hours-day 8)
(defvar toggled-minute-day 0)

;; Night hour(19:00)
(defvar toggled-hours-night 19)
(defvar toggled-minute-night 0)

;; daylight theme
(defvar toggled-themes-day nil)
;; (defvar toggled-themes-day 'solarized-light)

;; night theme
;; (defvar toggled-themes-night 'monokai)
;; (defvar toggled-themes-night 'solarized-dark)
(defvar toggled-themes-night 'srcery)

(defun day-hour-p (morning-hour night-hour)
  "Check now is on day, or night.

Return t if MORNING-HOUR <= now <= NIGHT-HOUR, otherwise nil."
  (let* ((now (decode-time (current-time)))
	 (hour (nth 2 now)))
    (and
     (>= hour morning-hour)
     (< hour night-hour))
    ))

;; (daylight-hour-minute-p 8 18)
;; (daylight-hour-minute-p '(8 30) '(18 30))

(defun time-to-float (@time)
  "Parse @TIME hour minute list to float style."
  (string-to-number
   (format "%d.%d" (car @time) (nth 1 @time))))

(defun daylight-p (start-time end-time)
  "Check current time is at daylight, or night.

Return t if START-TIME <= now <= END-TIME, otherwise nil."
  (let* ((start_t (time-to-float start-time))
	 (end_t (time-to-float end-time))
	 (now_t (string-to-number (format-time-string "%H.%S"))))
    (and
     (>= now_t start_t)
     (<= now_t end_t))))

(defun next-theme (day-theme night-theme)
  "Toggle theme to DAY-THEME when in daylight, otherwise NIGHT-THEME."
  (let* ((is-day (daylight-p (list toggled-hours-day toggled-minute-day)
			     (list toggled-hours-night toggled-minute-night)))
	 (target-theme (if is-day day-theme night-theme))
	 (current-theme (car custom-enabled-themes)))
    (unless (eq current-theme target-theme)
      ;; allow set theme to `nil'.
      (if target-theme
	  (load-theme target-theme t)
	(mapc 'disable-theme custom-enabled-themes))
      (message "%s is-day: %s, change theme %s => %s"
	       (format-time-string "%Y-%m-%d %H:%M:%S")
	       is-day current-theme target-theme))
    )
  )

(defun change-theme (interval)
  "Change theme run `next-theme' in every INTERVAL seconds.
Smart delay in the first time."
  (interactive "p")
  (next-theme toggled-themes-day toggled-themes-night)

  (let* ((now-secs (car (decode-time (current-time))))
	 (delay-secs (- 60 now-secs)))
    (if (> delay-secs 0)
	(message "Adjust delay %d secs" delay-secs))
    (run-with-timer delay-secs interval
		    'next-theme toggled-themes-day toggled-themes-night))
  )

(change-theme 60)

(provide 'init-themes)
;;; init-themes.el ends here
