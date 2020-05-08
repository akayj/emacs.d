;;; init-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:

;; (setq evil-mode-line-format '(before . mode-line-front-space))
;;; modify evil-state-tag
;; Color the evil tag - colors taken from spaceline
(setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag    (propertize "[E]" 'face '((:background "SkyBlue2"       :foreground "black")))
      evil-insert-state-tag   (propertize "[I]" 'face '((:background "chartreuse3"    :foreground "black")))
      evil-replace-state-tag  (propertize "[R]" 'face '((:background "chocolate"      :foreground "black")))
      evil-motion-state-tag   (propertize "[M]" 'face '((:background "plum3"          :foreground "black")))
      evil-visual-state-tag   (propertize "[V]" 'face '((:background "gray"           :foreground "black")))
      evil-operator-state-tag (propertize "[O]" 'face '((:background "sandy brown"    :foreground "black"))))


(setq mode-name-replace-plist
      '(
	Emacs-Lisp 8721
	Lisp\ Interaction 955
	;; Foundamental "F"
	Python "Py"
	))

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . 945) ;; α
    (yas-minor-mode . 9422)
    (paredit-mode . nil)
    (eldoc-mode . nil)
    (abbrev-mode . nil)
    (auto-revert-mode . nil)

    (counsel-mode . nil)
    (flycheck-mode . 9403)

    ;; Major modes
    (lisp-interaction-mode . 955) ;; λ
    (hi-lock-mode . nil)
    ;; (python-mode . "Py")
    (python-mode . 128013)
    (go-mode . 128063)
    (go-dot-mod-mode . 128063)

    ;; (emacs-lisp-mode . 8721)
    (Emacs-Lisp . "EL")
    (nxhtml-mode . "nx")
    (projectile-mode . "P")

    (helm-mode . 9405)
    (company-mode . 9426)

    (undo-tree-mode . nil)

    (smartparens-mode . nil)
    (whitespace-cleanup-mode . nil)

    (ivy-mode . nil)
    (evil-escape-mode . nil)
    (evil-commentary-mode . nil)
    )
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

;; 简化 `major-mode' 的名字
(defun simplify-major-mode-name ()
  "Return simplifyed major mode name."
  (let* ((major-name (format-mode-line "%m"))
	 ;; (replace-table mode-line-cleaner-alist)
	 (replace-table mode-name-replace-plist)
	 ;; (replace-table '(Emacs-Lisp "EL"))
	 (replace-name (plist-get replace-table (intern major-name))))
	 ;; (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name
	(if (numberp replace-name)
	    (char-to-string replace-name)
	  replace-name)
      major-name)))

(setq-default mode-line-format
      (list
	;; evil state
	" "
	'(:eval (evil-generate-mode-line-tag evil-state))

	;; buffer name; the file name as a tool tip
	" "
	'(:eval (propertize "%b " 'face 'font-lock-keyword-face
			    'help-echo (buffer-file-name)))

	;; row and column
	"("
	(propertize "%02l" 'face 'font-lock-type-face) ","
	(propertize "%02c" 'face 'font-lock-type-face)
	") "

	;; major mode
	"["
	'(:eval (propertize (simplify-major-mode-name) 'face 'font-lock-string-face))
	"]"

	;; file modified?
	" "
	'(:eval (when (buffer-modified-p)
		(concat "," (propertize "Mod"
					'face 'font-lock-warning-face
					'help-echo "Buffer modified"))))
	)
      )

;; (defun clean-mode-line ()
;;   (interactive)
;;   (dolist (cleaner mode-line-cleaner-alist)
;;     (let* ((mode (car cleaner))
;;	   (mode-val (cdr cleaner))
;;	   (mode-str (if (numberp mode-val) (char-to-string mode-val) mode-val))
;;	   (old-mode-str (cdr (assq mode minor-mode-alist))))
;;       (when old-mode-str
;;	(setcar old-mode-str (if mode-str (format " %s" mode-str) "")))
;;       ;; major mode
;;       (when (eq mode major-mode)
;;	(setq mode-name mode-str)))))

;; (add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; (use-package anzu
;;   :ensure t
;;   :config
;;   (global-anzu-mode +1)
;;   (setq anzu-cons-mode-line-p nil))

;; (use-package diminish
;;   :ensure t
;;   :defer t)

;; (use-package spaceline
;;   :ensure t

;;   :init
;;   (setq powerline-default-separator 'slant)

;;   :config
;;   (spaceline-emacs-theme)
;;   (spaceline-toggle-minor-modes-off)
;;   ;; (spaceline-toggle-evil-state-on)
;;   (spaceline-toggle-buffer-size-off)
;;   (spaceline-toggle-evil-state-on))

;; (use-package doom-modeline
;;   :ensure t
;;   :hook
;;   (after-init . doom-modeline-mode)

;;   :config
;;   (setq doom-modeline-height 25)
;;   (setq doom-modeline-bar-width 3)
(set-face-attribute 'mode-line nil :family "DejaVu Sans Mono" :height 125)
(set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans Mono" :height 125)

;;   (setq doom-modeline-icon (display-graphic-p))
;;   ;; (setq doom-modeline-major-mode-icon t)
;;   ;; (setq doom-modeline-buffer-state-icon t)

;;   ;; display the environment version.
;;   (setq doom-modeline-env-enable-python t)
;;   (setq doom-modeline-env-enable-go t)

;;   (setq doom-modeline-major-mode-color-icon t)
;;   (setq doom-modeline-lsp t)
;;   (setq doom-modeline-enable-word-count t)
;;   (setq doom-modeline-project-detection 'project)
;;   (doom-modeline-def-modeline 'my-simple-line
;;     '(bar matches buffer-info remote-host buffer-position parrot selection-info)
;;     '(misc-info minor-modes input-method buffer-encoding major-mode process vcs checker))

;;   (defun setup-custom-doom-modeline ()
;;     (doom-modeline-set-modeline 'my-simple-line))

;;   (add-hook 'doom-modeline-mode-hook 'setup-custom-doom-modeline)
;;   )

;; (use-package all-the-icons :ensure t)


(provide 'init-modeline)
;;; init-modeline.el ends here
