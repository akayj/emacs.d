;;; init-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:
(use-package all-the-icons :ensure t)

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
    (company-mode . 9426))
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

(defvar mode-name-replace-plist
      '(
	emacs-lisp-mode 8721
	lisp-interaction-mode 955
	org-mode 120570
	;; Foundamental "F"
	;; go-mode 128063
	go-mode 9404
	python-mode 120587
	markdown-mode 120615
	org-mode 120570
	))

;; 简化 `major-mode' 的名字
(defun simplify-major-mode-name ()
  "Return simplifyed major mode name."
  (if (display-graphic-p)
      (all-the-icons-icon-for-file (buffer-name) :height 0.98 :v-adjust -0.15)
    (propertize "%m"'face '((:foreground "blue" :weight bold)))
    )
  )

(defun vc-modeline-setup ()
  "Setup vc status in modeline."
  (if vc-mode
      (let* ((noback (replace-regexp-in-string
		      (format "^ %s" (vc-backend buffer-file-name))
		      " "
		      vc-mode))
	     (face (cond ((string-match "^ -" noback) 'mode-line-vc)
			 ((string-match "^ [:@]" noback) 'mode-line-vc-edit)
			 ((string-match "^ [!\\?]" noback) 'mode-line-vc-modified))))
	(format " %s" (substring noback 2)))
    )
  )

(defun semantic-file-size (size)
  "Semantic file's SIZE."
  (let* (($fsize size)
	 ($units "BKMG")
	 ($index (1- (length $units))))
    (while (and (<= 0 $index)
		(<= $fsize (expt 2 (* 10 $index))))
      (setq $index (1- $index)))

    (format "%.2f%s" (/ (* $fsize 1.0) (expt 2 (* 10 $index)))
	    (substring $units $index (1+ $index)))))

(defun current-file-size ()
  "Calculate current file's size."
  (when (buffer-file-name)
    (semantic-file-size (point-max))))

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
	    (propertize "%b ")
	    ;; (propertize "%b " 'face 'font-lock-keyword-face)
	    ))

	;; row and column
	"("
	(propertize "%02l" 'face 'font-lock-type-face) ","
	(propertize "%02c" 'face 'font-lock-type-face)
	") "

	;; '(:eval (current-file-size))
	'(:eval (propertize (current-file-size) 'face '((:foreground "red" :weight bold))))
	" "

	;; major mode
	;; '(:eval (propertize (simplify-major-mode-name) 'face 'font-lock-string-face))
	'(:eval (simplify-major-mode-name))
	;; "["
	;; '(:eval (minor-mode-str))
	;; "] "
	;; mode-line-modes
	;; '(vc-mode vc-mode)
	'(:eval (vc-modeline-setup))
	)
      )

;; (set-face-attribute 'mode-line nil :family "DejaVu Sans Mono" :height 150)
;; (set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans Mono" :height 150)


(provide 'init-modeline)
;;; init-modeline.el ends here
