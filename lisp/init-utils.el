;;; init-utils.el -- utils library
;;; Commentary:

;;; Code:
;;;###autoload
(defun install-missing-package (pkgs)
  "Install missing packages PKGS."
  (let ((missing-packages (seq-filter (lambda (elm) (not (package-installed-p elm))) pkgs)))
    (when missing-packages
      (package-refresh-contents)
      (dolist (p missing-packages)
        (unless (package-installed-p p)
          (package-install p)
          (message "%s is installed!" (show-package-info p)))))))

;;;###autoload
(defun show-package-info (pkg &optional version-separator)
  (interactive "sPackage name: ")
  (when (package-installed-p pkg)
    (let* ((separator (if version-separator version-separator "."))
           (desc (cadr (assoc pkg package-alist)))
           (name (symbol-name pkg))
           (version (string-join
                     (seq-map (lambda (n) (number-to-string n))
                              (package-desc-version desc))
                     separator)))
      (format "%s %s" name version))))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
	(make-directory dir t)))))

;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
;; TODO: install missing package from an `URL'.
(unless (featurep 'cmake-mode)
  (require 'cmake-mode))


(provide 'init-utils)
;;; init-utils.el ends here
