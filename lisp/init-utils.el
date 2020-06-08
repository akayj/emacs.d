;;; init-utils.el -- utils library
;;; Commentary:

;;; Code:
;;;###autoload
(defun install-missing-package (pkgs)
  "Install missing packages PKGS."
  (dolist (p pkgs)
    (unless (package-installed-p p)
      (package-refresh-contents)
      (package-install p)
      (message "%s is installed!" p))))

;; https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
;; TODO: install missing package from an `URL'.
(unless (featurep 'cmake-mode)
  (require 'cmake-mode))


(provide 'init-utils)
;;; init-utils.el ends here
