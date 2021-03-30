;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
	      '(emacs-lisp-mode c-mode c++-mode js-mode latex-mode plain-text-mode))
      (if (and (eolp) (not (bolp)))
	  (progn (forward-char 1)
		 (just-one-space 0)
		 (backward-char 1)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument ARG) in the kill ring."
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)


;; simple copy line
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
		  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "C-c C-k") 'copy-line)

;; duplicate current line
;; (defun duplicate-current-line (&optional n)
;;   "Duplicate current line, make more than 1 copy given a numeric argument."
;;   (interactive "p")
;;   (save-excursion
;;     (let ((nb (or n 1))
;; 	  (current-line (thing-at-point 'line)))
;;       ;; when on last line, insert a newline first
;;       (when (or (= 1 (forward-line 1))
;; 		(insert "\n"))
;; 	;; now insert as many time as requested
;; 	(while (> n 0)
;; 	  (insert current-line)
;; 	  decf n)))))

;; (global-set-key (kbd "C-S-d") 'duplicate-current-line)


(provide 'init-shortcut)
;;; init-shortcut.el ends here
