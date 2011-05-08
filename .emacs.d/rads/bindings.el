(global-set-key (kbd "RET") 'newline-and-indent)

;; From Steve Yegge's Effective Emacs
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Shell
(global-set-key (kbd "C-x C-z") 'shell)

;; Window movement
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x 4 t") 'transpose-buffers)
(global-set-key (kbd "C-z") nil) ;; Don't minimize

;; File finding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Ruby RI
(global-set-key (kbd "C-h r") 'yari)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
