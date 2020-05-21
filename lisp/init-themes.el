;;; init-themes.el -- custom themes

;;; Commentary:

;;; Code:
(install-missing-package
 '(monokai-theme solarized-theme))

;; (use-package monokai-theme
;;   :ensure t
;;   :config
;;   (load-theme 'monokai t)

;;   ;; :custom
;;   ;; ;; foreground and background
;;   ;; ;; (monokai-foreground "#ABB2BF")
;;   ;; (monokai-foreground "white")
;;   ;; (monokai-background     "#282C34")
;;   ;; ;; highlights and comments
;;   ;; ;; (monokai-comments       "#F8F8F0")
;;   ;; (monokai-comments       "#999")
;;   ;; ;; (monokai-emphasis       "#282C34")
;;   ;; ;; (monokai-highlight      "#FFB269")
;;   ;; ;; (monokai-highlight-alt  "#66D9EF")
;;   ;; (monokai-highlight-line "#1B1D1E")
;;   ;; (monokai-line-number    "#F8F8F0")
;;   ;; ;; colours
;;   ;; (monokai-blue           "#61AFEF")
;;   ;; (monokai-cyan           "#56B6C2")
;;   ;; (monokai-green          "#98C379")
;;   ;; (monokai-gray           "#3E4451")
;;   ;; (monokai-violet         "#C678DD")
;;   ;; (monokai-red            "#E06C75")
;;   ;; (monokai-orange         "#D19A66")
;;   ;; (monokai-yellow         "#E5C07B")
;;   )

;; (use-package theme-changer :ensure t
;;   :config
;;   (change-theme 'solarized-light 'solarized-dark))

;; Sample usage
;; (load-theme 'solarized-light t)

(defun day-hour-p (morning-hour night-hour)
  "Check now is on day, or night.

Return t if MORNING-HOUR <= now <= NIGHT-HOUR, otherwise nil."
  (let* ((now (decode-time (current-time)))
	 (hour (nth 2 now)))
    (and
     (>= hour morning-hour)
     (<= hour night-hour))
    ))

;; Day hour
(defvar toggled-hours-day 8)
;; Night hour
(defvar toggled-hours-night 19)

(defvar toggled-themes-day nil)
;; (defvar toggled-themes-day 'solarized-light)
(defvar toggled-themes-night 'monokai)
;; (defvar toggled-themes-night 'solarized-dark)

(defun next-theme (day-theme night-theme)
  "Toggle theme to DAY-THEME when in daylight, otherwise NIGHT-THEME."
  (let* ((is-day (day-hour-p toggled-hours-day toggled-hours-night))
	 (target-theme (if is-day day-theme night-theme))
	 (current-theme (get 'next-theme 'theme)))
    (unless (eq current-theme target-theme)
      ;; allow set theme to `nil'.
      (if target-theme
	  (load-theme target-theme t)
	(disable-theme current-theme))
      ;; cache current theme
      (put 'next-theme 'theme target-theme)
      (message "change theme %s => %s" current-theme target-theme))
    )
  )

(defun change-theme (day-theme night-theme)
  "Sample change theme to bettwen DAY-THEME and NIGHT-THEME."
  (let* ((is-day (get 'change-theme 'is-day))
	 (target-theme (if is-day day-theme night-theme))
	 (current-theme (get 'change-theme 'theme)))

    ;; switch day and night.
    (if is-day
	(put 'change-theme 'is-day nil)
      (put 'change-theme 'is-day t))

    (unless (eq current-theme target-theme)
      ;; allow set theme to `nil'.
      (if target-theme
	  (load-theme target-theme t)
	(disable-theme current-theme))
      ;; cache current theme
      (put 'change-theme 'theme target-theme)
      (message "change theme %s => %s" current-theme target-theme))
    )
  )
;; (run-with-timer 0 10 'change-theme nil toggled-themes-night)

(run-with-timer 0 60 'next-theme toggled-themes-day toggled-themes-night)

(provide 'init-themes)
;;; init-themes.el ends here
