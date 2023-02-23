(use-package tree-sitter
     :ensure t)

(use-package tree-sitter-langs
     :ensure t
     :config
     ;; (global-tree-sitter-mode 1)
     )

(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)

(provide 'init-treesitter)
