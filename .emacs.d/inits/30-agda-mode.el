;; Agda-mode setting

(load-file (let ((coding-system-for-read 'utf-8))
                 (shell-command-to-string "agda-mode locate")))

(__DEBUG (shell-command-to-string "agda-mode locate"))
