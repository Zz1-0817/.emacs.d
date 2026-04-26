(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode t)

(use-package company
  :ensure t               
  :init
  (global-company-mode t))
