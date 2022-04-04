;;; init.el -- entry file for emacs configurtions

;;; Commentary:

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; set C-x C-f start directory
(setq default-directory (concat (getenv "HOME") "/"))

(setq gc-cons-threshold 400000)
(add-hook 'focus-out-hook #'garbage-collect) ; auto gc while all frames lost focus.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; all backups placed in ~/.backups instead in the current directory
;; (setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))
(setq make-backup-files nil)
(setq show-paren-mode t)
(setq auto-save-default nil)
(show-paren-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(set-default 'fill-column 80)

(defvar emacs-load-start-time (current-time))

(require 'time-date nil t)

(defun load-my-package (name)
  "Load package NAME, and message its cost time in seconds."
  (interactive "P")
  (let ((start-time (current-time)))
    (when (require name nil t)
      (message "Load `%s' cost: %.2f secs"
	       name (time-to-seconds (time-since start-time))))))

;; (require 'init-utils)
(load-my-package 'init-utils)

;; (require 'init-elpa)
(load-my-package 'init-elpa)

;; (require 'init-alias nil t)
(load-my-package 'init-alias)

(require 'init-symbols)
(require 'init-gui)
;; (require 'init-shortcut)
(require 'init-windows)

;; (require 'init-mail)
; (autoload 'wl "wl" "Wanderlust" t)

;; (require 'init-rss)

;; (require 'init-helm)

;; (require 'init-evil)
(load-my-package 'init-evil)

;; (require 'init-yasnippet)
(load-my-package 'init-yasnippet)

(require 'init-company-mode)
(require 'init-pair)

(require 'init-swiper)
(require 'init-find)

(require 'init-whitespace)
(require 'init-todo)

(require 'init-tags)

;; rust
;; (require 'init-rust)
(load-my-package 'init-rust)

;; golang
(require 'init-golang)
(require 'init-golang-lsp)
(require 'init-grpc)

;; javascript
(require 'init-js)
;; yaml
(require 'init-yaml)
(require 'init-toml)

;; lua
(require 'init-lua)

;; python
(require 'init-python)

;; powershell
(require 'init-ps)

;; git
(require 'init-git)

;; (require 'init-ibuffer)
(require 'init-themes)

(require 'init-csv)

;; (require 'init-diminish)

(require 'init-keys)

(require 'init-modeline)
;; (require 'init-modeline2)
(load-my-package 'init-modeline)

;; (require 'init-org)
;; (load-my-package 'init-org)

(require 'init-vue)

;; (require 'init-flycheck)


(require 'init-dockerfile)

(require 'init-tree)
(require 'init-projectile)

(use-package esup
  :ensure t
  :pin melpa)

(when (require 'time-date nil t)
  (message "Emacs startup time: %.2f seconds."
	   (time-to-seconds (time-since emacs-load-start-time))))

(if (string-prefix-p "vagrant" system-name)
    (load-theme toggled-themes-night t)
  ;; (with-eval-after-load 'init-themes
  ;;   (change-theme 60))
  )

(provide 'init)
;;; init.el ends here
