;;; init-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:

;; (setq evil-mode-line-format '(before . mode-line-front-space))
;;; modify evil-state-tag
;; Color the evil tag - colors taken from spaceline
;; (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "DarkGoldenrod2" :foreground "black")))
;;       ;; evil-emacs-state-tag    (propertize "[E]" 'face '((:background "purple"       :foreground "white")))
;;       evil-emacs-state-tag    (propertize "[E]" 'face 'font-lock-function-name-face)
;;       evil-insert-state-tag   (propertize "[I]" 'face '((:background "chartreuse3"    :foreground "black")))
;;       evil-replace-state-tag  (propertize "[R]" 'face '((:background "chocolate"      :foreground "black")))
;;       evil-motion-state-tag   (propertize "[M]" 'face '((:background "plum3"          :foreground "black")))
;;       evil-visual-state-tag   (propertize "[V]" 'face '((:background "gray"           :foreground "black")))
;;       evil-operator-state-tag (propertize "[O]" 'face '((:background "sandy brown"    :foreground "black"))))


(defvar mode-name-replace-plist
      '(
	Emacs-Lisp 8721
	Lisp\ Interaction 955
	;; Foundamental "F"
	;; Go 128063
	Python 120587
	Markdown 120615
	Org 120570
	))

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . 945) ;; α
    (yas-minor-mode . 9422)
    ;; (paredit-mode . nil)
    ;; (eldoc-mode . nil)
    ;; (abbrev-mode . nil)
    ;; (auto-revert-mode . nil)

    ;; (counsel-mode . nil)
    (flycheck-mode . 9403)

    ;; Major modes
    ;; (lisp-interaction-mode . 955) ;; λ
    ;; (hi-lock-mode . nil)
    ;; (python-mode . "Py")

    ;; (emacs-lisp-mode . 8721)
    (projectile-mode . "P")

    (helm-mode . 9405)
    (company-mode . 9426)

    ;; (undo-tree-mode . nil)
    ;; (smartparens-mode . nil)
    ;; (whitespace-cleanup-mode . nil)

    ;; (ivy-mode . nil)
    ;; (evil-escape-mode . nil)
    ;; (evil-commentary-mode . nil)
    )
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

;; FIXME: this can not modify modeline correctlly
;; (defun minor-mode-str ()
;;   (setq results "")
;;   (let* (
;;	 (modes (seq-filter (lambda (cleaner) (assq (car cleaner) minor-mode-alist)) mode-line-cleaner-alist)))
;;     (dolist (mode modes)
;;       (setq results (concat results (char-to-string (cdr mode))))
;;       ))
;;   results)

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
	'(:eval
	  (if (and buffer-file-name (buffer-modified-p))
	      (propertize "%b " 'face '((:foreground "red" :weight bold :slant italic))
			'help-echo (buffer-file-name))
	    (propertize "%b " 'face 'font-lock-keyword-face)
	    ))

	;; row and column
	"("
	(propertize "%02l" 'face 'font-lock-type-face) ","
	(propertize "%02c" 'face 'font-lock-type-face)
	") "

	;; major mode
	'(:eval (propertize (simplify-major-mode-name) 'face 'font-lock-string-face))
	;; "["
	;; '(:eval (minor-mode-str))
	;; "] "
	;; mode-line-modes
	'(vc-mode vc-mode)
	)
      )

;; (set-face-attribute 'mode-line nil :family "DejaVu Sans Mono" :height 150)
;; (set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans Mono" :height 150)

;; (use-package all-the-icons :ensure t)

(provide 'init-modeline)
;;; init-modeline.el ends here
