(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq gc-cons-threshold 400000)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; all backups goto ~/.backups instead in the current directory
;; (setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))
(setq make-backup-files nil)
(setq show-paren-mode t)

(require 'init-elpa)
(require 'init-gui-frames)
(require 'init-shortcut)

(require 'init-evil)
(require 'init-company-mode)
(require 'init-autopair)

(require 'init-whitespace)

;; golang
(require 'init-golang)

;; python
(require 'init-python)

;; git
(require 'init-git)

;; (require 'init-ibuffer)
(require 'init-themes)

(provide 'init)
;; init.el ends here
