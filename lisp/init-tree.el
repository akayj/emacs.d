;;; init-tree.el -- neotree configurtions

;;; Commentary:

;;; Code:
(use-package all-the-icons :ensure t
  ;; :config
  ;; (all-the-icons-wicon "tornado")
  ;; (insert (all-the-icons-icon-for-file "tsx"))
  ;; (all-the-icons-icon-for-file "a.tsx")
  ;; (all-the-icons-fileicon "tsx")
  )

(use-package find-file-in-project :ensure t)

(defun neotree-ffip-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (message "Could not find git project root."))))

(use-package neotree
  :ensure t
  :requires (all-the-icons evil)
  :config
  (evil-leader/set-key "g" 'neotree-ffip-project-dir)

  :hook
  (neotree-mode .
	    (lambda ()
	      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
	      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "g") 'neotree-refresh)
	      (define-key evil-normal-state-local-map (kbd "n") 'neotree-next-line)
	      (define-key evil-normal-state-local-map (kbd "p") 'neotree-previous-line)
	      (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
	      (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))
  :custom
  (neo-theme (if (display-graphic-p) 'icons 'arrow))
  )


(provide 'init-tree)
;;; init-tree.el ends here
