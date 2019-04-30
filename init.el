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

(require 'init-usepackages)

(require 'init-evil)
(require 'init-company-mode)
(require 'init-autopair)

;; golang
(require 'init-golang)

;; git
(require 'init-git)

(provide 'init)
;; init.el ends here
