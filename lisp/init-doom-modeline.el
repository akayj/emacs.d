;;; init-doom-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))


(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
