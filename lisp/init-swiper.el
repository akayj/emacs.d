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
  (define-key swiper-evil-keymap (kbd "r") 'counsel-rg)
  (define-key swiper-evil-keymap (kbd "g") 'counsel-git)
  )


(use-package counsel
  :ensure t
  :init
  (evil-leader/set-key "v" swiper-evil-keymap)

  :config
  (counsel-mode 1)

  :bind
  (("C-s" . counsel-grep-or-swiper)	; global
   ("C-x C-f" . counsel-find-file))

  ;; :bind (:map help-map
  ;;	      ("f" . counsel-describe-function)
  ;;	      ("v" . counsel-describe-variable)
  ;;	      ("C-l" . counsel-info-lookup-symbol))

  :custom
  (counsel-grep-base-command
   "rg -i -M 120 --no-heading --line-number --color never '%s' %s")
  )


(provide 'init-swiper)
;;; init-swiper.el ends here
