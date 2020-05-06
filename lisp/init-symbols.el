;;; init-symbols.el -- setup prettify symbols for multi modes

;;; Commentary:

;;; Code:
;; perttify symbols
(defun my-add-pretty-lambda ()
  "Make some word or string show as pretty Unicode symbols."
  (setq prettify-symbols-alist
	'(
	  ("lambda" . 955)
	  ("->" . 8594)
	  ("=>" . 8658)
	  ("!=" . 8800)
	  ))
  (prettify-symbols-mode))


(defun my-org-symbols ()
  "Make pretty Unicode symbols for `org-mode'."
  (setq prettify-symbols-alist
	'(
	  ;; ("[ ]" . 0x2610) ;; ☐
	  ;; ("[X]" . 0x2611) ;; ☑
	  ;; ("[-]" . 0x274d) ;; ❍
	  ("[ ]" . 9744) ;; ☐
	  ("[X]" . 9745) ;; ☑
	  ("[-]" . 10061) ;; ❍
	  ))
  (prettify-symbols-mode))

(provide 'init-symbols)
;;; init-symbols.el ends here
