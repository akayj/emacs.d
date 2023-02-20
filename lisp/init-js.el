;;; init-js.el --- Javascript configurations -*- lexical-binding: t -*-

;; Author: yj
;; Maintainer: yj
;; Version: 0.1
;; Package-Requires: (use-package)
;; Homepage: askingyj.cn
;; Keywords: Javascript, TypeScript


;; This file is not part of GNU Emacs

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:
(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

  :hook
  (js2-mode . my-add-pretty-lambda))

(add-hook 'json-mode-hook
	  (lambda ()
	    (make-local-variable 'js-indent-level)
	    (setq js-indent-level 2)))

(use-package tern :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

  ;; :hook
  ;; (web-mode . (lambda ()
  ;;		(when (string-equal "tsx" (file-name-extension buffer-file-name))
  ;;		  (setup-tide-mode))))
  )

;;;###autoload
(defun setup-tide-mode ()
  "Setup web-mode."
  (tide-setup)
  (tide-hl-identifier-mode)

  ;; evil keys
  (evil-define-key 'normal tide-mode-map "gd" 'tide-jump-to-definition)
  (evil-define-key 'normal tide-mode-map "gb" 'tide-jump-back)
  )

(use-package vue-mode
  :ensure t

  :config
  ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
  (setq mmm-submode-decoration-level 0)
  )

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  ;; :config

  :hook ((typescript-mode . setup-tide-mode)
	 (before-save . tide-format-before-save)))


(provide 'init-js)
;;; init-js.el ends here
