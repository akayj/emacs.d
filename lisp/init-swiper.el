;;; init-swiper.el -- provides swiper/counsel/ivy packages

;;; Commentary:

;;; Code:
(use-package ivy
  :ensure t
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)

  :config
  (ivy-mode 1))


(use-package counsel
  :ensure t
  :config
  ;; (evil-leader/set-key
  ;;   "a" 'counsel-ag
  ;;   "g" 'counsel-git
  ;;   )
  (counsel-mode 1)
  )


(provide 'init-swiper)
;;; init-swiper.el ends here
