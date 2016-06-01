(cd "~")
(setq custom-file "~/.emacs.d/customizations.el")

(defun __DEBUG(xs)
  (progn
    (message "*************")
    (message "INIT_DEBUGGING:filename::%s" load-file-name)
    (message "INIT_DEBUGGING:%s" xs)
    (message "*************")
    ))

(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))

