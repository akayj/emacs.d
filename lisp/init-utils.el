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
	(package-install p)
	(message "%s is installed!" (show-package-info p))))))

;;;###autoload
(defun show-package-info (pkg &optional version-separator)
  (when (package-installed-p pkg)
    (let* ((separator (if version-separator version-separator "."))
	   (desc (cadr (assoc pkg package-alist)))
	   (name (symbol-name pkg))
	   (version (string-join
		     (seq-map (lambda (n) (number-to-string n))
			      (package-desc-version desc))
		     separator)))
      (format "%s, version: %s" name version))))

;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
;; TODO: install missing package from an `URL'.
(unless (featurep 'cmake-mode)
  (require 'cmake-mode))


(provide 'init-utils)
;;; init-utils.el ends here
