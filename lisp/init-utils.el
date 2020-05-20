;;; init-utils.el -- utils library
;;; Commentary:

;;; Code:
(defun install-missing-package (pkgs)
  "Install missing packages PKGS."
  (dolist (p pkgs)
    (unless (package-installed-p p)
      (package-install p)
      (message "%s is installed!" p))))

(provide 'init-utils)
;;; init-utils.el ends here
