;;; init-elpa.el -- setup elpa mirror -*- lexical-binding: t -*-

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


;; Emacs China
(setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
			 ("melpa" . "http://1.15.88.122/melpa/")
			 ("melpa-stable" . "http://1.15.88.122/stable-melpa/")
			 ("org" . "http://1.15.88.122/org/")))

;; USTC 中科大
;; (setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
;;                          ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/stable-melpa/")
;;                          ;; ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")
;;                          ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))

;; 清华源
;; (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;                          ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
;;                          ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; 腾讯源
;; (setq package-archives '(("gnu" . "http://mirrors.cloud.tencent.com/elpa/gnu/")
;;                           ("melpa" . "https://melpa.org/packages/")
;;                           ("melpa-stable" . "https://stable.melpa.org/packages/")
;;                           ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
;;                           ("melpa-stable" . "http://mirrors.cloud.tencent.com/elpa/melpa-stable/")
;;                           ("org" . "https://mirrors.cloud.tencent.com/elpa/org/")))

;; (setq package-archives '(("myelpa-local" . "~/myelpa/")))
(add-to-list 'package-archives '("myelpa-local" . "~/myelpa/"))

;; FIXME: connection refused
;; https://raw.githubusercontent.com/akayj/myelpa/master/
;; (add-to-list 'package-archives '(("myelpa" . "https://raw.githubusercontent.com/akayj/myelpa/master/")))
;; (setq package-archives '(("myelpa" . "https://gitee.com/askingyj/myelpa/raw/master/")))

;; (setq package-archives '(("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/")))
;; (add-to-list 'package-archives '("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/"))

; (add-to-list 'package-archives '(
;          ("myelpa-gitee" . "https://gitee.com/askingyj/myelpa/raw/master/")
;      )
;  )

(setq package-archive-priorities
      '(("melpa-stable" . 20)
	("gnu" . 10)
	("melpa" . 6)
	("myelpa-local" . 100)))

(package-initialize)

;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))

(defvar my-packages
  '(use-package better-defaults)
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
;;   (auto-package-update-prompt-before-update t)
;;   (auto-package-update-hide-results nil)
;;   :config
;;   (auto-package-update-maybe))

;;;###autoload
(defun delete-old-pkgs ()
  "Delete old version packags."
  (interactive)
  (let ((basedir package-user-dir))
  ;; (let ((basedir "/Users/yujianjian/myelpa"))
    (dolist (f (directory-files basedir t "[^\\(\\.\\|\\.\\.\\|\\.DS_Store\\|\\.git\\|archives\\)$]"))
      (when (and
	     (file-directory-p f)
	     (not (member f load-path)))
	(delete-directory f t t)
	(message "%s deleted\n" (file-name-nondirectory f))))
    (message "cleanup packages under %s" basedir)))

(provide 'init-elpa)
;;; init-elpa.el ends here
