;;; init.el -- entry file for emacs configurtions

;;; Commentary:

;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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

(require 'init-utils)

(require 'init-elpa)

(require 'init-alias nil t)

(require 'init-symbols)
(require 'init-gui-frames)
;; (require 'init-shortcut)

(require 'init-helm)

(require 'init-evil)
(require 'init-company-mode)
(require 'init-pair)

(require 'init-swiper)

(require 'init-whitespace)

(require 'init-completion)

;; golang
(require 'init-golang)
(require 'init-golang-lsp)
;; javascript
(require 'init-js)
;; yaml
(require 'init-yaml)
(require 'init-toml)

;; lua
(require 'init-lua)

;; python
(require 'init-python)

;; git
(require 'init-git)

;; (require 'init-ibuffer)
(require 'init-themes)

(require 'init-csv)

(require 'init-diminish)

(require 'init-keys)

(require 'init-modeline)

(require 'init-org)

(require 'init-flycheck)

(require 'init-yasnippet)

(require 'init-dockerfile)

(require 'init-tree)
(require 'init-projectile)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
	   (time-to-seconds (time-since emacs-load-start-time))))

(provide 'init)
;;; init.el ends here
