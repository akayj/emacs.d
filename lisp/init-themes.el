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

;; (defun next-theme ()
;;   "Change to the next theme."
;;   )

;; (run-with-timer 0 60 'next-theme)

(provide 'init-themes)
;;; init-themes.el ends here
