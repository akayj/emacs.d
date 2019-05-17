(require 'package)

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility.
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
			 user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))


(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)


(defvar my-packages '(use-package
                      better-defaults
                      color-theme-sanityinc-tomorrow)
  "A list of packages to ensure are installed at launch.")


(package-refresh-contents)

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

;;(dolist (p my-packages)
;;  (unless (package-installed-p p)
;;    (condition-case err
;;	(package-refresh-contents)
;;      (package-install p)
;;      (error
;;       (message "%s" (error-message-string err))))))


(provide 'init-elpa)
;; init-elpa.el ends here
