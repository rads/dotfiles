;; Coding hook
(add-hook 'coding-hook 'turn-on-whitespace)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
(add-hook 'coding-hook 'add-watchwords)
(add-hook 'coding-hook 'idle-highlight)
(add-hook 'coding-hook 'turn-on-autopair)

;; C
(add-hook 'c-mode-hook 'run-coding-hook)
(add-hook 'c-mode-hook (lambda ()
  (setq c-electric-flag nil)
  (setq c-basic-offset 4)
  (abbrev-mode 0)))

;; CSS
(add-hook 'css-mode-hook 'run-coding-hook)
(setq css-indent-offset 2)

;; Yasnippet
(add-to-list 'load-path (concat vendor-dir "yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat vendor-dir "yasnippet/snippets"))
(yas/load-directory (concat dotfiles-dir "rads/snippets"))
(setq yas/prompt-functions '(yas/dropdown-prompt))

;; Text modes
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook 'add-watchwords)

;; HTML
(add-hook 'html-mode-hook 'run-coding-hook)
(add-hook 'html-mode-hook (lambda () (flyspell-mode -1)))

;; Markdown
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-mode))

;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook '(lambda ()
  (run-coding-hook)
  (setq js-indent-level 2)))

;; Ruby
(add-hook 'ruby-mode-hook 'run-coding-hook)
(add-hook 'ruby-mode-hook (lambda ()
  (define-key ruby-mode-map (kbd "RET") 'newline-and-indent)))

(eval-after-load 'ruby-mode
  '(progn
     (set (make-local-variable 'tab-width) 2)
     (setq ruby-use-encoding-map nil)))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Rinari (Minor Mode for Ruby On Rails)
(setq rinari-major-modes
      (list 'mumamo-after-change-major-mode-hook 'dired-mode-hook 'ruby-mode-hook
            'css-mode-hook 'yaml-mode-hook 'javascript-mode-hook))

;; Textmate and Peepopen
(add-to-list 'load-path (concat vendor-dir "textmate.el/"))
(require 'textmate)
(require 'peepopen)
(textmate-mode)

;; Autopair
(require 'autopair)

;; CoffeeScript
(add-to-list 'load-path (concat vendor-dir "coffee-mode"))
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode hook"
  (set (make-local-variable 'tab-width) 2)
  (setq coffee-js-mode 'javascript-mode)
  (define-key coffee-mode-map (kbd "RET") 'newline-and-indent))
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))
(add-hook 'coffee-mode-hook 'run-coding-hook)
