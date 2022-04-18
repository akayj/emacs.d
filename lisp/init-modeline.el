;;; init-modeline.el -- custom my modeline

;;; Commentary:

;;; Code:
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(setq my-flycheck-mode-line
      '(:eval
	(pcase flycheck-last-status-change
	  (`not-checked nil)
	  (`no-checker (propertize " -" 'face 'warning))
	  (`running (propertize " ✷" 'face 'success))
	  (`errored (propertize " !" 'face 'error))
	  (`finished
	   (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
		  (no-errors (cdr (assq 'error error-counts)))
		  (no-warnings (cdr (assq 'warning error-counts)))
		  (face (cond (no-errors 'error)
			      (no-warnings 'warning)
			      (t 'success))))
	     (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
			 'face face)))
	  (`interrupted " -")
	  (`suspicious '(propertize " ?" 'face 'warning)))))

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

(defun mode-line-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
	      'display `((space :align-to
				(- (+ right right-fringe right-margin) ,reserve)))
	      'face face))

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
  "Return simplified major mode name."
  ;; 如果没有icon的替换能力，就直接使用文字显示
  (if (and (display-graphic-p) (featurep 'all-the-icons-icon-for-file))
      (all-the-icons-icon-for-file (buffer-name) :height 0.98 :v-adjust -0.15)
    (propertize "%m" 'face '((
			      ;; :foreground "blue"
			      :weight bold)))
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
			 ((string-match "^ [!\\?]" noback) 'mode-line-vc-modified)))
	     (branch-name (format " %s" (substring noback 2))))
	(propertize branch-name 'face 'font-lock-type-face))
    )
  )

(defun trailing-dup-zero (num)
  (if (= (floor num) num)
      (format "%d" (floor num))
    (format "%.2f" num)))

(defun semantic-file-size (size &optional kilo)
  "Semantic file's SIZE in KILO."
  (let* (($fsize size)
	 ($kilo (if kilo kilo 1024))
	 ($units "BKMG")
	 ($index (1- (length $units)))
	 ($mod (expt $kilo $index)))
    (while (and
	    (<= 0 $index)
	    (<= $fsize $mod))
      (setq $index (1- $index))
      (setq $mod (expt $kilo $index)))

    ;; (format "%s%s"
    ;;	    (trailing-dup-zero (/ (* $fsize 1.0) $mod))
    ;;	    (substring $units $index (1+ $index)))))
    (concat (trailing-dup-zero (/ (* $fsize 1.0) $mod))
	    (substring $units $index (1+ $index)))))

(defun current-file-size ()
  "Calculate current file's size."
  (when (buffer-file-name)
    (propertize (semantic-file-size (buffer-size))
		'face 'all-the-icons-red)))

(defun current-buffer-loc ()
  "Calculate line of code of current buffer."
  (when (buffer-file-name)
    (propertize (format " %d loc" (count-lines (point-min) (point-max)))
		'face 'all-the-icons-purple)))

(setq-default mode-line-format
	      (list
	       ;; evil state
	       " "
	       '(:eval (evil-generate-mode-line-tag evil-state))

	       ;; major mode
	       " "
	       '(:eval (simplify-major-mode-name))

	       ;; buffer name; the file name as a tool tip
	       " "
	       '(:eval
		 (if (and buffer-file-name (buffer-modified-p))
		     (propertize "%b " 'face '((:foreground "red"))
				 'help-echo (format "%s <未保存>" (buffer-file-name)))
		   (propertize "%b " 'help-echo (buffer-file-name))
		   ))

	       ;; Read-Only
	       '(:eval
		 (if (and buffer-file-name buffer-read-only)
		     (propertize "RO " 'face '((:foreground "yellow")))
		   ))

	       ;; '(vc-mode vc-mode)
	       '(:eval (vc-modeline-setup))

	       " "

	       '(:eval (current-file-size))

	       ;; '(:eval (current-buffer-loc))

	       ;; minor modes
	       ;; minor-mode-alist

	       "%1 "
	       my-flycheck-mode-line

	       ;; global-mode-string goes in mode-line-misc-info
	       mode-line-misc-info

	       (mode-line-fill 'mode-line 20)

	       ;; row and column
	       (propertize "%2l/%2c" 'face 'font-lock-type-face)

	       ;; mode-line-end-spaces
	       " "
	       '(:eval (propertize (format-time-string "%H:%M")
				   'help-echo
				   (concat (format-time-string "%c; ")
					   (emacs-uptime))))
	       " "
	       ))

;; (set-face-attribute 'mode-line nil :family "DejaVu Sans Mono" :height 150)
;; (set-face-attribute 'mode-line-inactive nil :family "DejaVu Sans Mono" :height 150)


(provide 'init-modeline)
;;; init-modeline.el ends here
