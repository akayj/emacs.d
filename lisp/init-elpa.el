(require 'package)

(setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(package-refresh-contents)
(package-install 'use-package)

(provide 'init-elpa)
;; init-elpa.el ends here
