(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"
         )
       '("melpa" .
         "http://melpa.milkbox.net/packages/"
         ))

(package-initialize)


(defvar my-packages '(clojure-mode
                       evil
                       clojure-test-mode
                       auto-complete
                       nrepl
                       ac-nrepl
                       rainbow-delimiters
		       projectile
		       flx-ido
                       ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'evil)
(evil-mode 1)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disabe ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(projectile-global-mode)

(require 'auto-complete)
(global-auto-complete-mode t)
(require 'ac-nrepl)
(require 'rainbow-delimiters)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(global-rainbow-delimiters-mode)
 (require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
