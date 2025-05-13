;; Icons
(use-package all-the-icons
  :ensure t
  :init)

(add-to-list 'load-path "~/.emacs.d/dired-icon.el")
(load "dired-icon.el")
(add-hook 'dired-mode-hook 'dired-icon-mode)

(use-package all-the-icons-dired
  :ensure t
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  ;; for some reason the icons by default are monochrome
  :config (setq all-the-icons-dired-monochrome nil))

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

;; Themes
(use-package ef-themes
  :if window-system
  :ensure t
  :config
  ;; Enable the theme
  (load-theme 'ef-dark t))
(mode-icons-mode)

;; Default Fonts
;; (add-to-list 'default-frame-alist
;; 	     '(font . "FiraCode Nerd Font-12"))
(add-to-list 'default-frame-alist
	       '(font . "JetBrains Mono-12"))

;; define default shell to use (LINUX ONLY)
  ;; (defvar my-term-shell "/bin/bash")
  ;; (defadvice ansi-term (befire force-bash)
  ;;   (interactive (list my-term-shell)))
  ;; (ad-activate 'ansi-term)
  ;; (global-set-key (kbd "<s-return>") 'ansi-term)

(put 'upcase-region 'disabled nil)
  (setq inhibit-startup-screen t
    ;initial-scratch-message ""
        )

  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (whitespace-mode 0)
  (global-display-line-numbers-mode 1)
  ;; (setq display-line-numbers-type 'relative)
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t)
  (setq ido-create-new-buffer 'always)

  ;; show all whitespaces
  (global-whitespace-mode t)
  (global-whitespace-newline-mode t)

  ;; Instead of M-x list-buffer from C-x C-b
  ;; make ibuffer default
  ;; (global-set-key (kbd "C-x C-b") 'ibuffer)
  (defalias 'list-buffers 'ibuffer)
  ;; (setq ibuffer-expert t)    ; assume u an expert, won't ask confirmation


  (electric-pair-mode t) ; For auto-closing brackets
  (fset 'yes-or-no-p 'y-or-n-p)  ;; change to y or n instead of yes no
  ;; (defaluas 'yes-or-no-p 'y-or-n-p)


  (setq scroll-conservatively 100)
  (setq ring-bell-function 'ignore)

  ;; Init Shine Cursor
  (use-package beacon
    :ensure t
    :init
    (beacon-mode 1))

  ;; Async where can, currently only Dired
(use-package async
  :ensure t
  :init (dired-async-mode 1))

  ;; maximise screen on startup
  (add-hook 'window-setup-hook 'toggle-frame-maximized t)

  (setq make-backup-files nil)	;; stop creating backup files
  (setq auto-save-default nil)	;; stop creating autosave files

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; Suggestions for emacs keys
;; (use-package which-key
;;   :ensure t
;;   :init
;;   (which-key-mode))

(use-package which-key
  :ensure t
  ;;  :straight t
  :init 
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order
	which-key-allow-imprecise-window-fit nil
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.8
	which-key-max-description-length 25
	which-key-allow-imprecise-window-fit nil
	which-key-separator " ? " ))

(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t))

(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be actived in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

;; Highligth Indent
(use-package highlight-indent-guides
  :ensure t
  :defer t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\|)
  (setq highlight-indent-guides-responsive 'top))


;; Color Brackets
(use-package rainbow-delimiters
  :ensure t
  :init
  ;; (rainbow-delimiters-mode 1))
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(show-paren-mode 1)    ;

;; Windows Mode Only Features
(when window-system
  (global-hl-line-mode t)		; global highlight line mode 
  ;; (global-prettify-symbols-mode t) 	; for icons like lambda & nill
  )

;; Show HEX COLORS
(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package spaceline
    :ensure t
    :config
    (require 'spaceline-config)
      (setq spaceline-buffer-encoding-abbrev-p nil)
      (setq spaceline-line-column-p nil)
      (setq spaceline-line-p nil)
      (setq powerline-default-separator (quote arrow))
      (spaceline-spacemacs-theme))

  ;; Hide unimportant Minor Modes in Modeline
  (use-package diminish
    :ensure t
    :init
    ; (diminish 'yas-minor-mode)
    ; (diminish 'flycheck-mode)
    ; (diminish 'helm-mode)
    ; (diminish 'irony-mode)
    ; (diminish 'linum-relative-mode)
    ; (diminish 'hungry-delete-mode)
    ; (diminish 'visual-line-mode)
    ; (diminish 'subword-mode)
    ; (diminish 'page-break-lines-mode)
    ; (diminish 'auto-revert-mode)
    (diminish 'all-the-icons-dired-mode)
    (diminish 'dired-async-mode)
    (diminish 'beacon-mode)
    (diminish 'highlight-indent-guides-mode)
    (diminish 'which-key-mode)
    (diminish 'whitespace-mode)
    (diminish 'global-whitespace-newline-mode)
    (diminish 'rainbow-delimiters-mode)
    (diminish 'rainbow-mode))

;; show clock
  (display-time-mode t)
;; (setq display-time-24hr-format t)
;; (setq display-time-format "%H:%M")

;; Search and show instances
(use-package swiper
  :ensure t
  ; :bind ("C-s" . swiper)
  :config (global-set-key "\C-s" 'swiper))

; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
;(global-unset-key (kbd "M-<down-mouse-1>"))
;(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-l") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
;; Mark First Then add cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

;; (use-package mark-multiple
;;   :ensure t
;;   :bind ("C-c q" . 'mark-next-like-this))

; Global Linting
(use-package flycheck
  :init (global-flycheck-mode))

;; Formatter
(use-package format-all
  :ensure t)
;; Run format-all to format buffer

(setq tab-bar-show 1) ;; Enable Tabs
(global-set-key (kbd "C-t") #'tab-new)
(global-set-key (kbd "C-q") #'tab-close)
;; C-Tab: Switch between tabs

;; TreEmacs
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (("C-c t" . treemacs))
  :config
  (setq treemacs-width 30)
  (setq-local mode-line-format nil))

;; Projectile Mode (Not working?)
(use-package projectile
  :ensure t
  :defer t
  :config
  ;; Enable Projectile globally
  (setq projectile-completion-system 'ido)
  (setq ido-enable-flex-matching t)
  (projectile-mode 1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package org-bullets
  :ensure t
  :defer t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; add line wraps when in org-mode
(add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))

(setq org-ellipsis " ")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-export-with-smart-quotes t)
(setq org-src-window-setup 'current-window)
(add-hook
 'org-mode-hook
 'org-indent-mode
 ;; add line wraps when in org-mode
 '(lambda () (visual-line-mode 1))

 )

;; Active Babel Language Executions in Org Mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)	  ;; enable a shell, regardless bash, fish etc...
   (python . t)	  ;; enable Python
   ))


;; add line wraps when in org-mode
(add-hook 'org-mode-hook '(lambda () (visual-line-mode 1)))

(use-package org-preview-html
  :ensure t
  :defer t)
;; :config
;; (add-hook 'org-mode-hook )
;;)

;; Syntax highlighting for documents exported to HTML
(use-package htmlize
  :ensure t)

(use-package focus)

(use-package org-modern
  :ensure t)
(with-eval-after-load 'org (global-org-modern-mode))

(electric-indent-mode -1)
(setq org-edit-src-content-indentation 0)

(use-package perspective
  :ensure t)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((python-mode rust-mode) . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :demand t
  :init
  (setq lsp-auto-guess-root nil)
  (setq lsp-keymap-prefix "C-c l")
  ;; TODO: https://emacs-lsp.github.io/lsp-mode/page/performance/
  ;; also note re "native compilation": <+varemara> it's the
  ;; difference between lsp-mode being usable or not, for me
  :config
  (setq lsp-auto-configure t))

;; (use-package lsp-mode
;;   :init
;;   (setq lsp-auto-guess-root nil)
;;   :hook (python-mode . lsp)
;;   (rust-mode . lsp)
;;   (lsp-mode . lsp-enable-which-key-integration)
;;   :commands lsp)

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-flycheck-enable t)
  (add-to-list 'lsp-ui-doc-frame-parameters '(no-accept-focus . t))
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :after lsp
  :commands lsp-treemacs-errors-list)

;; Company Auto Complete
(use-package company
  :after lsp-mode
  :hook (prog-mode . company-mode)
  :bind
  (:map company-active-map
  	("<tab>" . comany-complete-selection))
  (:map lsp-mode-map
  	("<tab>" . company-indent-or-complete-common))
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil) ;; unset defaults
  (define-key company-active-map (kbd "M-p") nil) ;; unset defaults
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))


(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(setq lsp-ui-doc-position 'bottom)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-show-with-mouse t)

  (setq lsp-ui-peek-enable t)

  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-diagnostic-max-lines t)

(setq lsp-eldoc-enable-hover t)

(use-package lsp-jedi
  :ensure t)

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t))

;; (with-eval-after-load 'company
;;   (add-hook 'python-mode-hook 'company-mode))

;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (require 'company)
;;   (add-to-list 'company-backends 'company-jedi))

;; (defun python-mode-company-init ()
;;   (setq-local company-backends '((company-jedi
;;                                   company-etags
;;                                   company-dabbrev-code))))

;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (require 'company)
;;   (add-hook 'python-mode-hook 'python-mode-company-init))

;; Open python files in tree-sitter mode.
;; (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; (use-package eglot
;;   :ensure t
;;   :defer t
;;   :bind (:map eglot-mode-map
;;               ("C-c C-d" . eldoc)
;;               ("C-c C-e" . eglot-rename)
;;               ("C-c C-o" . python-sort-imports)
;;               ("C-c C-f" . eglot-format-buffer))
;;   :hook ((python-ts-mode . eglot-ensure)
;;          (python-ts-mode . flyspell-prog-mode)
;;          (python-ts-mode . superword-mode)
;;          (python-ts-mode . hs-minor-mode)
;;          (python-ts-mode . (lambda () (set-fill-column 88))))
;;   :config
;;   (setq-default eglot-workspace-configuration
;;                 '((:pylsp . (:configurationSources ["flake8"]
;; 						   :plugins (
;; 							     :pycodestyle (:enabled :json-false)
;; 							     :mccabe (:enabled :json-false)
;; 							     :pyflakes (:enabled :json-false)
;; 							     :flake8 (:enabled :json-false
;; 									       :maxLineLength 88)
;; 							     :ruff (:enabled t
;; 									     :lineLength 88)
;; 							     :pydocstyle (:enabled t
;; 										   :convention "numpy")
;; 							     :yapf (:enabled :json-false)
;; 							     :autopep8 (:enabled :json-false)
;; 							     :black (:enabled t
;; 									      :line_length 88
;; 									      :cache_config t)))))))



(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
;; (add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

(use-package slime-company
  :ensure t
  :init
  (require 'company)
  (slime-setup '(slime-fancy slime-company)))

;; using ccl;; s
;; (use-package ccls
;;     :hook ((c-mode c++-mode cuda-mode) .
;;   	     (lambda () (require 'ccls) (lsp))))
;; (setq ccls-executable "/usr/bin/ccls")
;; (setq ccls-use-default-rainbow-sem-highlight 'font-lock)
;; (ccls-code-lens-mode 1)

;; (with-eval-after-load 'company
;;   (add-hook 'c++-mode-hook 'company-mode)
;;   (add-hook 'c-mode-hook 'company-mode))

;; (use-package company-c-headers
;;   :ensure t)

;; (use-package toml-mode)
;; (use-package rust-mode
;;   :hook (rust-mode . lsp))

;; (use-package yasnippet
;;   :config
;;   (yas-reload-all)
;;   (add-hook 'prog-mode-hook 'yas-minor-mode)
;;   (add-hook 'text-mode-hook 'yas-minor-mode))
