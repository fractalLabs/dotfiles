;; Add Marmalade package archive for Emacs starter kit and other Emacs packages

(require 'package)
(add-to-list 'package-archives
'("marmalade" . "http://marmalade-repo.org/packages/") )
(package-initialize)


;; Add Clojure and other supporting packages to the Emacs environment
;; Packages are installed if they are not already present
;; The list includes packages for the starter kit, Clojure and markdown files (used by github)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell starter-kit-bindings
clojure-mode clojure-test-mode
        rainbow-delimiters
        ac-slime
markdown-mode ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Useful global settings as Emacs is used predominantely for Clojure development

;; Launch the Clojure repl via Leiningen - M-x clojure-jack-in
;; Global shortcut definition to fire up clojure repl and connect to it

(global-set-key (kbd "C-c C-j") 'nrepl-jack-in)


;; Colour mach parens and other structure characters to make code easy to follow

(global-rainbow-delimiters-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-interval (quote ((js-mode 1.5) (default 0.0005)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable auto indent
(auto-indent-mode)

;; Enable auto brace/bracket pair
(electric-pair-mode)

;; Some colors
(set-background-color "black")
(set-foreground-color "white")

(require 'w3m-load)
