;;; init.el -- Let's go!
;;; Commentary:
;;; Code:
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; UI
(setq ns-use-native-fullscreen nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(defun ui-after-init ()
  (if (display-graphic-p)
      (load-theme 'zenburn))
  (if (fboundp 'toggle-frame-fullscreen)
      (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'ui-after-init)

;; Editing
(require 'auto-complete)

;; Navigation
(windmove-default-keybindings)
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
(require 'python-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(set-variable 'flycheck-highlighting-mode 'lines)
(add-hook 'after-init-hook 'global-flycheck-mode)
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(custom-safe-themes
   (quote
    ("282606e51ef2811142af5068bd6694b7cf643b27d63666868bc97d04422318c1" "da7fa7211dd96fcf77398451e3f43052558f01b20eb8bee9ac0fd88627e11e22" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "11d069fbfb0510e2b32a5787e26b762898c7e480364cbc0779fe841662e4cf5d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Ubuntu bugfixes - keyboard issue. Was unable to type ' " '.
(require 'iso-transl)

;;https://snarfed.org/gnu_emacs_backup_files
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

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

;; Magit
(setq magit-last-seen-setup-instructions "1.4.0")
