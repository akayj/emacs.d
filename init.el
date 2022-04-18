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
      (message "[%s] load cost: %f seconds"
	       name (time-to-seconds (time-since start-time))))))

(defvar required-package-alist
  '(
    init-utils
    init-elpa
    init-alias
    init-symbols
    init-gui
    init-windows

    init-evil
    init-yasnippet

    init-company-mode
    init-pair

    init-swiper
    init-find

    init-whitespace
    init-todo

    init-tags

    ;; rust
    init-rust

    ;; golang
    init-golang
    init-golang-lsp
    init-grpc

    ;; javascript
    init-js
    ;; yaml
    init-yaml
    init-toml

    ;; lua
    init-lua

    ;; python
    init-python
    ;; powershell
    init-ps
    ;; git
    init-git
    init-themes
    init-csv

    init-keys

    init-modeline

    init-vue

    init-dockerfile

    init-tree
    init-projectile
    ))

(dolist (p required-package-alist)
  (load-my-package p))

;; (use-package esup
;;   :ensure t
;;   :pin melpa)

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
