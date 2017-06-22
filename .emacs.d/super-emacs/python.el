;Python dependencies
; pip install virtualenv epc jedi flake8
;Make sure to run: M-x jedi:install-server

;setup flycheck and jedi for python mode
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; use default keybindings
(setq jedi:complete-on-dot t)                 ; automatically start completion after inserting a dot


;; auto-complete
(autoload 'ac-config-default "auto-complete-config")
(ac-config-default)
;; If you really like the menu
(setq ac-show-menu-immediately-on-auto-complete t)
;; Enable auto-complete for python
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes `python-mode))

;setup flycheck and jedi for python mode
(add-hook 'python-mode-hook
          (lambda ()
            (require 'auto-complete)
            (flycheck-mode 1)
            (setq flycheck-checker 'python-flake8)))

;On MacOS also add the following to fix your $PATH environment variable:
(exec-path-from-shell-initialize)

;virtualenv
(setq python-environment-directory "~/.virtualenvs")
