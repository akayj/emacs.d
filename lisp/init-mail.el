;;; init-mail.el

;;; Commentary:

;;; Code:
(add-to-list 'load-path (expand-file-name "mu4e" user-emacs-directory))

(require 'smtpmail)

(setq user-full-name "余剑剑"
      user-mail-address "yujianjian@xinye.com")

;; Sent mail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "partner.outlook.cn"
      smtpmail-smtp-user "yujianjian@xinye.com"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls
      smtpmail-use-gnutls nil)

(require 'mu4e)
(setq mu4e-mu-binary "/usr/local/bin/mu")
(setq mu4e-maildir (expand-file-name "~/mails/xinye"))

(setq
 mu4e-sent-foler  "/xinye/Sent Mail"
 mu4e-drafts-folder  "/xinye/Drafts"
 mu4e-trash-folder  "/xinye/Trash"
 mu4e-refile-folder  "/xinye/All Email"
 )

;; Get mail
(setq mu4e-get-mail-command "mbsync -c ~/.mbsyncrc -a"
      mu4e-html2text-command "w3m -T text/html"
      mu4e-update-interval 60
      mu4e-headers-auto-update t
      mu4e-hide-index-messages t
      mu4e-compose-signature-auto-include nil)

(add-hook 'mu4e-index-updated-hook
	  (defun new-mail-sound ()
	    ;; (shell-command "afplay /System/Library/Sounds/Glass.aiff &")
	    (message "new mail received")
	    ))

(setq mu4e-view-show-images t)
(setq mu4e-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(provide 'init-mail)
;;; init-mail.el ends here
