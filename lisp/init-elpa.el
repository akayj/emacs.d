;;; init-elpa.el -- setup elpa mirror

;;; Commentary:

;; This file setup variable `package-archives'
;; install the `elpa-mirror' for package archives, that we can host
;; them on other places, like github or your private version control system,
;; even local directory or Dropbox, Baidu NetDisk.

;;; Code:
(require 'package)

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility.
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
			 user-emacs-directory)))
  (setq package-user-dir versioned-package-dir)
  (message "Install packages into %s" package-user-dir))


(add-to-list 'load-path (expand-file-name "elpamr" user-emacs-directory))
(require 'elpa-mirror)
(setq elpamr-default-output-directory "~/myelpa")
(setq elpamr-debug t)
;; (elpamr-create-mirror-for-installed)

;; 清华源
(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
                         ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; (setq package-archives '(("myelpa-local" . "~/myelpa/")))
;; (add-to-list 'package-archives '("myelpa-local" . "~/myelpa/"))

;; FIXME: connection refused
;; https://raw.githubusercontent.com/akayj/myelpa/master/
;; (add-to-list 'package-archives '(("myelpa" . "https://raw.githubusercontent.com/akayj/myelpa/master/")))
;; (setq package-archives '(("myelpa" . "https://gitee.com/askingyj/myelpa/raw/master/")))

;; (setq package-archives '(("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/")))
;; (add-to-list 'package-archives '("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/"))

;; (add-to-list 'package-archives '(
;;          ("myelpa-gitee" . "https://gitee.com/askingyj/myelpa/raw/master/")
;;      )
;;  )

;; (setq package-archive-priorities
;;       '(("melpa-stable" . 20)
;; 	("gnu" . 10)
;; 	("melpa" . 6)
;; 	("myelpa-local" . 100)))

(package-initialize)


(defvar my-packages '(use-package
                      better-defaults
                      color-theme-sanityinc-tomorrow)
  "A list of packages to ensure are installed at launch.")

(install-missing-package my-packages)
;; (dolist (p my-packages)
;;   (unless (package-installed-p p)
;;     (package-refresh-contents)
;;     (package-install p)
;;     (message "%s is installed" p)))

;;(dolist (p my-packages)
;;  (unless (package-installed-p p)
;;    (condition-case err
;;	(package-refresh-contents)
;;      (package-install p)
;;      (error
;;       (message "%s" (error-message-string err))))))

;; (use-package auto-package-update
;;   :ensure t
;;   :custom
;;   (auto-package-update-delete-old-version t)
;;   (auto-package-update-hide-results nil)
;;   :config
;;   (auto-package-update-maybe))

(provide 'init-elpa)
;;; init-elpa.el ends here
