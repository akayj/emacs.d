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

(defvar swiper-evil-keymap nil "Swiper keymap for evil mode.")
(setq swiper-evil-keymap (make-sparse-keymap))
(progn
  (define-key swiper-evil-keymap (kbd "a") 'counsel-ag)
  (define-key swiper-evil-keymap (kbd "g") 'counsel-git)
  )


(use-package counsel
  :ensure t
  :config
  (evil-leader/set-key "v" swiper-evil-keymap)
  (counsel-mode 1)
  )


(provide 'init-swiper)
;;; init-swiper.el ends here
