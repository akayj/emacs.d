;;; package -- summary
;;; Code:
;;; Commentary:
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  ;; Set the prefix string that will be inserted in front of prefix commnads
  ;; (i.e., commands that represent a sub-map).
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Custom keybinding
;; (use-package general
;;   :ensure t
;;   :config
;;   (general-define-key
;;    :state '(normal visual insert emacs)
;;    :prefix "SPC"
;;    ;; :non-normal-prefix "M-SPC" '(counsel-rg :which-key "ripgrep")
;;    "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
;;    "SPC" '(helm-M-x :which-key "M-x")
;;    ))

;; built-in *help* replacement
(use-package helpful
  :ensure t

  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command))

(provide 'init-keys)
;;; init-keys.el ends here
