;;; init-elpa.el -- setup elpa mirror

;;; Commentary:

;; This file setup variable `package-archives'
;; install the `elpa-mirror' for package archives, that we can host
;; them on other site, like github or your private git site, even local directory.

;;; Code:
(require 'package)

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility.
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
			 user-emacs-directory)))
  (setq package-user-dir versioned-package-dir)
  (message "Install packages into %s" package-user-dir))


(require 'elpa-mirror)
(setq elpamr-default-output-directory "~/myelpa")
;; (elpamr-create-mirror-for-installed)
(setq elpamr-debug t)

(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "https://orgmode.org/elpa/")))


; FIXME: connection refused
; https://raw.githubusercontent.com/akayj/myelpa/master/
; (add-to-list 'package-archives '(("myelpa" . "https://raw.githubusercontent.com/akayj/myelpa/master/")))
; (setq package-archives '(("myelpa" . "https://gitee.com/askingyj/myelpa/raw/master/")))

; (add-to-list 'package-archives '("myelpa" . "~/myelpa/"))
; (setq package-archives '(("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/")))
;; (add-to-list 'package-archives '("myelpa-ppd" . "http://git.ppd.com/yujianjian/myelpa/raw/master/"))

; (add-to-list 'package-archives '(
         ;; ("myelpa-gitee" . "https://gitee.com/askingyj/myelpa/raw/master/")
     ; )
 ; )

(package-initialize)


(defvar my-packages '(use-package
                      better-defaults
                      color-theme-sanityinc-tomorrow)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-refresh-contents)
    (package-install p)
    (message "%s is installed" p)))

;;(dolist (p my-packages)
;;  (unless (package-installed-p p)
;;    (condition-case err
;;	(package-refresh-contents)
;;      (package-install p)
;;      (error
;;       (message "%s" (error-message-string err))))))

(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-delete-old-version t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))

(provide 'init-elpa)
;;; init-elpa.el ends here
