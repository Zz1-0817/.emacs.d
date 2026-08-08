(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file 'noerror)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode t)
(which-key-mode 1)
(recentf-mode 1)
(setq recentf-max-saved-items 100)

(add-hook 'after-init-hook 'global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)

(use-package vertico
  :ensure t
  :init (vertico-mode 1))

(use-package marginalia
  :ensure t
  :after vertico
  :config (marginalia-mode 1))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles basic partial-completion)))))

(use-package corfu
  :ensure t
  :config
  (global-corfu-mode 1)
  (setq corfu-auto t
	corfu-quit-at-boundary t))

(use-package cape
  :ensure t
  :config
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-elisp-symbol)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package rust-ts-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook (rust-ts-mode . flymake-mode)
  )

(use-package eglot
  :ensure t
  :defer t
  :commands (eglot eglot-ensure)
  ;; :hook ((rust-ts-mode python-mode) . eglot-ensure)
  :config
    (setq eglot-autoshutdown t)
    (setq eglot-report-progress nil)
    (add-hook 'eglot-managed-mode-hook
              (lambda () (corfu-mode 1)))
    )

(use-package magit
  :ensure t)

