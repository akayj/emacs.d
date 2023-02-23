(use-package youdao-dictionary
  :ensure t

  :bind
  ("C-c y" . 'youdao-dictionary-search-at-point-posframe)
  ("C-c s" . 'youdao-dictionary-play-voice-at-point)
  )

(provide 'init-translate)
