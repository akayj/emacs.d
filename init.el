;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Adjust garbage collection threshold during startup, and thereafter
;;(let ((normal-gc-cons-threshold (* 20 1024 1024))
;;      (init-gc-cons-threshold (* 128 1024 1024)))
;;  (setq gc-cons-threshold init-gc-cons-threshold)
;;  (add-hook 'emacs-startup-hook
;;	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq gc-cons-threshold 400000)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; all backups goto ~/.backups instead in the current directory
;; (setq backup-directory-alist (quote (("." . "~/.emacs-backups"))))
(setq make-backup-files nil)

(require 'init-elpa)
(require 'init-gui-frames)
(require 'init-shortcut)

;; golang
(add-to-list 'load-path (expand-file-name "lisp/go-mode.el" user-emacs-directory))
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(provide 'init)
;; init.el ends here
