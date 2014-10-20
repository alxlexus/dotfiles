(require 'package)
(add-to-list 'package-archives 
             '("marmalade" .
               "http://marmalade-repo.org/packages/"
               )
             '("melpa" .
               "http://melpa.milkbox.net/packages/"
               ))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode
                       evil
                       auto-complete
                       cider
                       rainbow-delimiters
                       projectile
                       flx-ido
                       color-theme-solarized
                       ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'evil)
(evil-mode 1)

(projectile-global-mode)

(require 'auto-complete)
(global-auto-complete-mode t)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)


;; Disable autosave
(setq auto-save-default nil) 

;; Disable backups
(setq backup-inhibited t)

;; Follow symlinks by default instead of asking
(setq vc-follow-symlinks t)

;; Use solarized theme
(load-theme 'solarized-light t)

;; Disable menu bar by default
(menu-bar-mode -1)

;; Line numbers on the left side of the screen
(global-linum-mode t)
