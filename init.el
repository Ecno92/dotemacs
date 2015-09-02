;;; init.el -- Let's go!
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Encoding
;; http://stackoverflow.com/questions/2901541/which-coding-system-should-i-use-in-emacs
(setq utf-translate-cjk-mode nil)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

;; UI
(setq ns-use-native-fullscreen nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(defun ui-after-init ()
  (if (display-graphic-p)
    (load-theme 'solarized t))
  (if (fboundp 'toggle-frame-fullscreen)
      (toggle-frame-fullscreen)))


(add-hook 'after-make-frame-functions
          (lambda (frame)
            (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

(add-hook 'after-init-hook 'ui-after-init)
(set-frame-font "Hack:pixelsize=14:foundry=unknown:weight=bold:slant=normal:width=normal:spacing=100:scalable=true")

;; Yes/No
(defalias 'yes-or-no-p 'y-or-n-p)

;; Startup - Default Screen
(setq inhibit-splash-screen t
      initial-scratch-message nil)

;; Editing
(require 'auto-complete)

;; Navigation
(windmove-default-keybindings)
;; Killing
(require 'browse-kill-ring)
(global-set-key "\C-cy" 'browse-kill-ring)
;; Direx & Popwin
(require 'popwin)
(popwin-mode 1)
(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
;; Windmove in terminal
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)



;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)

(setq-default indent-tabs-mode nil)
(show-paren-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; Minibuffer
(setq enable-recursive-minibuffers t)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(ido-mode)
(ido-everywhere)
(ido-ubiquitous-mode)
(setq ido-enable-flex-matching t)

;; Projects
(projectile-global-mode)

;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Python
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(set-variable 'flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook 'global-flycheck-mode)
(require 'virtualenvwrapper)
(require 'py-yapf)


;; Shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'comint)
(setq comint-password-prompt-regexp
      (concat
       "\\("
       "Password for 'http.*':"
       "\\|"
       comint-password-prompt-regexp
       "\\)"
       ))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq-default show-trailing-whitespace t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;Ubuntu bugfixes - keyboard issue. Was unable to type ' " '.
(require 'iso-transl)

;; Disable backups
(setq make-backup-files nil)

;; Show lines which exceed a limit
;; http://emacsredux.com/blog/2013/05/31/highlight-lines-that-exceed-a-certain-length-limit/
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)


;; Redo mode - Windows style
(require 'redo+)
(define-key global-map (kbd "C-/") 'undo)
(define-key global-map (kbd "C-x C-/") 'redo)

;; Git related
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-x g") 'magit-status)
(require 'browse-at-remote)
(require 'git-link)

;; Vagrant-tramp
(eval-after-load 'tramp
  '(vagrant-tramp-enable))
