;; Disable mouse interface.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Set up load path.
(setq dotfiles-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))
(setq vendor-dir (concat dotfiles-dir "vendor/"))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path vendor-dir)

;; Set up ELPA.
(require 'package)
(dolist
  (source '(("technomancy" . "http://repo.technomancy.us/emacs/")
            ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)
(load (concat dotfiles-dir "rads/elpa.el"))

;; Require basic packages.
(require 'cl)         ;; Common Lisp Extension
(require 'saveplace)  ;; Save place in files.
(require 'uniquify)   ;; Use more sensible buffer names.
(require 'ansi-color) ;; Add ANSI color in shells.
(require 'recentf)    ;; Keep track of recently modified files.
(require 'imenu)

;; Load system- and user-specific config.
(setq system-specific-config (concat dotfiles-dir "rads/systems/" system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

(load (concat dotfiles-dir "local.el"))

;; Load my customizations.
(load (concat dotfiles-dir "rads/defuns.el"))
(load (concat dotfiles-dir "rads/bindings.el"))
(load (concat dotfiles-dir "rads/misc.el"))
(load (concat dotfiles-dir "rads/modes.el"))

(when window-system
  (server-start))
