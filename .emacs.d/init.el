;; -*- lexical-binding: t -*-

(require 'package)

;;;Code:
(setq package-enable-at-startup nil)


;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/") t))

(unless (assoc-default "nongnu" package-archives)
  (add-to-list 'package-archives
	       '("nongnu" . "https://elpa.nongnu.org/nongnu/") t))


;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;Set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


; Store emacs generated customisation here
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; Use Configuration from config.org
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
;; (set-fontset-font "fontset-default" 'unicode "Noto Color Emoji")



;Self-Defined Gloval Keybindings
;(global-set-key (kbd "C-x C-k") 'kill-current-buffer)


; TO SHOW START TIME
; (message "emacs init time %s" (emacs-init-time ))
