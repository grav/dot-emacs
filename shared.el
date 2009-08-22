(setq custom-basedir (expand-file-name "~/.emacs.d/"))   
(defun add-path (p)
  (add-to-list 'load-path (concat custom-basedir p)))

;;remove all trailing whitespace before saving the file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;enable icomplete
(icomplete-mode 1)
(setq icomplete-compute-delay 0)
(load-file "~/.emacs.d/vendor/icomplete+.el")
(require 'icomplete+)


;;WindMove (for easy window navigation (no more C-x o
;;To move between windows use S-(<left>|<right>|<up>|<down>)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;make ^h delete rather than help
(keyboard-translate ?\C-h ?\C-?)

;;redefine help to be C-M-h
(global-set-key (kbd "C-M-h") 'help)

;;macro to insert text above the current line
(fset 'insert-above
   [?\C-e return ?\C-a ?\C-k ?\C-p ?\C-p M-return])
(global-set-key (kbd "M-h") 'insert-above)

;allow the deletion of words:
;backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-w") 'backward-kill-word)
;delete current word
(global-set-key (kbd "M-w") (lambda () (interactive) (backward-word) (kill-word 1)))

;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;;repeat previous command
(global-set-key (kbd "C-.") 'repeat)

;;shortcuts for growing and shrinking windows horizontally
(global-set-key (kbd "C-<") 'enlarge-window-horizontally)
(global-set-key (kbd "C->") 'shrink-window-horizontally)

;get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;fast vertical naviation
(global-set-key  (kbd "M-p") (lambda () (interactive) (previous-line 10) (recenter)))
(global-set-key  (kbd "M-n") (lambda () (interactive) (next-line 10) (recenter)))

;;make sure ansi colour character escapes are honoured
(ansi-color-for-comint-mode-on)

;;enable winner mode for C-c-(<left>|<right>) to navigate the history
;;of buffer changes i.e. undo a split screen
(when (fboundp 'winner-mode)
      (winner-mode 1))

;; Minor Modes
(add-path "vendor")
(require 'textmate)
(textmate-mode 1)  

;;wrap region
;(add-to-list 'load-path "~/.emacs.d/vendor/wrap-region")
(require 'wrap-region)

;;yassnippet
(add-path "vendor/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")

;;ioke mode
(autoload 'ioke-mode "ioke-mode")
(autoload 'run-ioke "inf-ioke" nil t)
(add-to-list 'auto-mode-alist '("\\.ik$" . ioke-mode))

