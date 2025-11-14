;; -*- lexical-binding: t -*-

(require 'package)

;; (setq package-enable-at-startup nil)


;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-archives
	  '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		("MELPA Stable" . "https://stable.melpa.org/packages/")
		("ORG"          . "https://orgmode.org/elpa/")
		("MELPA"        . "https://melpa.org/packages/")
		("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
	  package-archive-priorities
	  '(("GNU ELPA"     . 20)
		("MELPA Stable" . 15)
		("ORG"          . 10)
		("MELPA"        . 5)
		("nongnu"       . 0)))

;; (unless (assoc-default "melpa" package-archives)
;;   (add-to-list 'package-archives
;; 	       '("melpa" . "https://melpa.org/packages/") t))

;; (unless (assoc-default "nongnu" package-archives)
;;   (add-to-list 'package-archives
;; 	       '("nongnu" . "https://elpa.nongnu.org/nongnu/") t))


;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; Don't follow to the dotfile directory
(setq vc-follow-symlinks nil)

;;Set UTF-8 encoding
;; UTF-8 as default encoding
(setq locale-coding-system 'utf-8)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)

; Store emacs generated customisation here
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; Improved Garbage Collection
;; FROM EMACS FROM SCRATCH
;; Make gc pauses faster by decreasing the threshold.
;; (setq gc-cons-threshold (* 2 1000 1000))

;; FROM UNCLE DAVE
;;; This fixed garbage collection, makes emacs start up faster ;;;;;;;
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;; Automatically Done in Doom?
;; ref: github.com/doomemacs/doomemacs/issues/3108
;; (after! gcmh
;;   (setq gc-cons-threshold  33554432
;;       gc-cons-percentage 0.6))  ; 32mb, or 64mb, or *maybe* 128mb, BUT NOT 512mb

;; Use Configuration from config.org
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
;; (set-fontset-font "fontset-default" 'unicode "Noto Color Emoji")



;Self-Defined Gloval Keybindings
;(global-set-key (kbd "C-x C-k") 'kill-current-buffer)


; TO SHOW START TIME
; (message "emacs init time %s" (emacs-init-time ))
