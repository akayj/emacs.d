;;; init-hl-indent.el -- setup highlight columns -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package highlight-indent-guides
  :ensure t

  :hook
  (prog-mode 'highlight-indent-guides-mode)

  :config
  ;; (set-default highlight-indent-guides-method 'character)

  ;; (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  ;; (set-face-background 'highlight-indent-guides-even-face "dimgray")
  ;; (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  )

(provide 'init-hl-indent)
;;; init-hl-indent.el ends here
