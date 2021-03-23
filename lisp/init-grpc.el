;;; init-grpc.el -- lsp support for golang
;;; Commentary:

(require 'protobuf-mode)

(defconst my-protobuf-style
  '((c-basic-offset . 2)
    (indent-tabs-mode . nil)))

(add-hook 'protobuf-mode-hook
	  (lambda () (c-add-style "my-style" my-protobuf-style t)))

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
    ;; (autoload 'go-mode "go-mode" nil t)

(provide 'init-grpc)
;;; init-grpc.el ends here
