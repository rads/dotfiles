;; Put the window on the top left.
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(width . 80))
(add-to-list 'default-frame-alist (cons 'height my-max-height))

;; Make the titles better and remove any UI.
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))
(add-hook 'before-make-frame-hook 'turn-off-tool-bar)

;; Use UTF-8.
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Enable ANSI color in terminals.
(ansi-color-for-comint-mode-on)

;; PeepOpen needs this
(setq ns-pop-up-frames nil)

(setq
  visible-bell t                      ;; Show the box in the middle of the
                                      ;; screen on error.
  echo-keystrokes 0.1                 ;; Show keystrokes in the minibuffer.
  font-lock-maximum-decoration t
  inhibit-startup-message t
  transient-mark-mode t               ;; Highlight the current region.
  color-theme-is-global t           ;; Don't want global color theme because
                                      ;; we're going to change it in server
                                      ;; mode.
;;  color-theme-is-cumulative nil
  delete-by-moving-to-trash t
  shift-select-mode nil               ;; Don't select when holding down shift.
  mouse-yank-at-point t               ;; Insert yanked text at the cursor, not
                                      ;; at the mouse pointer.
  require-final-newline t             ;; Add a newline at the end of every
                                      ;; file.
  truncate-partial-width-windows nil  ;; Continue long lines instead of
                                      ;; truncating them.
  uniquify-buffer-name-style 'forward ;; Use names like tmp/Makefile and
                                      ;; zaphod/Makefile instead of names like
                                      ;; Makefile and Makefile<2>.

  flyspell-issue-message-flag nil     ;; Flyspell is slow if this is not nil.
  vc-handled-backends nil             ;; Disable version control.

  ;; Show when spaces and tabs are next to each other.
  whitespace-style '(trailing lines space-before-tab
                     face indentation space-after-tab)

  whitespace-line-column 80           ;; Highlight lines longer than 80 cols.

  xterm-mouse-mode t                  ;; Allow mouse clicks in the terminal.
  save-place-file (concat dotfiles-dir "places"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Color theme
(add-to-list 'load-path (concat vendor-dir "color-theme"))
(add-to-list 'load-path (concat vendor-dir "zenburn"))
(require 'color-theme)
(require 'zenburn)
;; (defun apply-color-theme (frame)
;;   (select-frame frame)
;;   (if (window-system frame)
;;       (zenburn)))
;; (add-hook 'after-make-frame-functions 'apply-color-theme)
(zenburn)


(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; Show column numbers
(column-number-mode t)

;; Only show the left fringe.
(set-fringe-mode (cons 4 0))

;; Save a list of recent files.
(recentf-mode t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)

;; ido mode
(ido-mode t)
(setq
  ido-enable-flex-matching t         ;; Use fuzzy name matching.
  ido-create-new-buffer 'always      ;; Always make a new buffer if nothing
                                     ;; matches.
  ido-max-prospects 10)              ;; Limit to 10 choices.

(set-default 'indent-tabs-mode nil)   ;; Use spaces, not tabs.
(set-default 'tab-width 4)
(set-default 'indicate-empty-lines t) ;; Show empty trailing lines.
(set-default 'imenu-auto-rescan t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't clutter up directories with files~
(setq temporary-file-directory (expand-file-name
                                 (concat dotfiles-dir "backups/")))
(setq backup-directory-alist `(("." . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Platform-specific stuff
(when (eq system-type 'darwin)
  ;; Work around a bug on OS X where system-name is FQDN
  (setq system-name (car (split-string system-name "\\."))))

;; make emacs use the clipboard
(setq x-select-enable-clipboard t)

;; Colors
(set-face-background 'vertical-border "white")
(set-face-foreground 'vertical-border "white")

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "white"))))

;; Full ack
(add-to-list 'load-path (concat vendor-dir "full-ack"))
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; Magit
(add-to-list 'load-path (concat vendor-dir "magit"))
(require 'magit)
