;;; Package --- Summary:
;;; Commentary:
;;; Code:
;; Set emacs window title

;; Init packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))

(setq frame-title-format "Emacs!")

;; Disable autosave
(setq auto-save-default nil)

;; Hide menu bar
(add-hook 'before-init-hook (lambda() (menu-bar-mode -1)))
;; Hide tool bar
(tool-bar-mode -1)

;; Hide scrollbar
(scroll-bar-mode -1)

;; Overwrite selection on input
(delete-selection-mode 1)

;; Enable truncate lines
(set-default 'truncate-lines t)
(setq-default indent-tabs-mode nil)

;; Disable startup screen on load
(setq inhibit-startup-screen t)

;; Enable lines
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)
(setq linum-format "%d ")

;; Disable mode line in doc-view mode
(add-hook 'doc-view-mode-hook 'doc-view-minor-mode)
(add-hook 'doc-view-minor-mode-hook '(lambda() (setq mode-line-format nil)))

;; Highlight lines in cursor
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'text-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'ggtags-mode)

;; Enable "electric" pairs
(electric-pair-mode 1)

;; Enable HideShow minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Y or N equal Yes or No
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable IDO mode (file browsing)
;; (ido-mode)

;; Enable Vertical IDO mode
(ido-vertical-mode t)

;; Enable IVY
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-x l") 'counsel-locate)

(global-set-key (kbd "C-c p SPC") 'counsel-projectile)
(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)
(global-set-key (kbd "C-c p d") 'counsel-projectile-find-dir)
(global-set-key (kbd "C-c p b") 'counsel-projectile-switch-to-buffer)
(global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)

(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; List of required packages
(require 'company) ;; Company autocomplete framework
(require 'company-irony) ;; Company plugin for C/C++ autocomplete
(require 'company-irony-c-headers) ;; Company plugin for C/C++ headers autocomplete
(require 'company-jedi) ;; Company plugin for Python autocomplete
(require 'company-cmake) ;; Company plugin for Cmake autocomplete
(require 'projectile) ;; Emacs project manager
(require 'irony) ;; C/C++ autocomplete backend
(require 'flycheck) ;; C/C++ syntax checking on fly
(require 'cmake-mode) ;; Cmake syntax highlight mode
(require 'verilog-mode) ;; Verilog
(require 'xelb) ;; Elisp X interface
(require 'exwm) ;; Emacs X Window Manager
(require 'exwm-config) ;; Emacs X Window Manager config
(require 'exwm-randr) ;; Emacs X Window Manager multi - monitor support
(require 'exwm-cm) ;; Emacs X Window Manager compose manager
(require 'exwm-systemtray) ;; Emacs X Window Manager systemtray
(require 'exwmx-core) ;; EXWM
(require 'ggtags) ;; Tags for code navigation

;; Pdf files opens in pdf-view mode
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-tools-install))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

;; Flycheck mode in python
(add-hook 'python-mode-hook 'flycheck-mode)

;; Flycheck mode in Tex
(add-hook 'tex-mode-hook 'flycheck-mode)

;; Enable global company mode
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'text-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'projectile-mode)

;; Add backends to company mode after load
(eval-after-load 'company '(add-to-list 'company-backends '(company-irony-c-headers company-irony company-jedi)))
(add-hook 'verilog-mode-hook (add-to-list 'company-keywords-alist (cons 'verilog-mode verilog-keywords)))
(add-hook 'verilog-mode-hook 'flycheck-mode)

(setq verilog-indent-level-module 2)
(setq verilog-indent-level-declaration 2)
(setq verilog-indent-level-behavioral 2)
(setq verilog-indent-level-directive 1)
(setq verilog-case-indent 2)
(setq verilog-auto-newline nil)
(setq verilog-auto-indent-on-newline t)
(setq verilog-tab-always-indent t)
(setq verilog-auto-endcomments t)
(setq verilog-minimum-comment-distance 40)
(setq verilog-indent-begin-after-if nil)
(setq verilog-auto-lineup 'declarations)
(setq verilog-highlight-p1800-keywords nil)
(setq verilog-tool 'verilog-linter)
(setq verilog-linter "verilator")
(setq verilog-coverage "verilator_coverage")
(setq verilog-simulator "iverilog")
(setq verilog-compiler "iverilog" )
(setq verilog-indent-level 2)

;; Enable syntax flycheck in C/C++ mode
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)
(add-hook 'c++-mode-hook 'ggtags-mode)

;; Enable flycheck in BASH
(add-hook 'sh-mode-hook 'flycheck-mode)

;; Regular expressions
(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)

;; Enable autocomplete backend in C/C++ mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)

;; Add action after load irony
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; Custom function hook for irony after load
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))

;; Add this function to irony load
(add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; Set delay to show autocomplete popup
(setq company-idle-delay 0)

;; Set minimum prefix length for autocomplete
(setq company-minimum-prefix-length 1)

;; Setup smart parens
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(smartparens-strict-mode 1)

;; Setup multiply cursors
(require 'multiple-cursors)
(require 'imenu-list)
(setq imenu-list-focus-after-activation t)
(setq imenu-list-auto-resize t)

;;; Move test functions
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
    (forward-line -1)))))

;; Move selected test functions
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

;; Disable backuping
(setq backup-inhibited t)

; Disable auto save
(setq auto-save-default nil)

;; Setup multiterm package
(setq flycheck-indication-mode nil)

;; Setup smart tabs indent mode
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Set default python interpreter
(setq python-shell-interpreter "python3")

;; Remap some key sequences
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-<down>") 'move-text-down) ;; Move line down
(global-set-key (kbd "M-<up>") 'move-text-up) ;; Move line up
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines) ;; Multiply cursors - edit lines
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;; Multiply cursors - mark next
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this) ;; Multiply cursors - mark prev
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this) ;; Multiply cursors - mark all
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle) ;; Toggle imenu list

(global-set-key (kbd "C-`") 'run-python) ;; Run python console
(global-set-key (kbd "C-c h a") 'hs-hide-all) ;; Hide-show - hide all
(global-set-key (kbd "C-c s a") 'hs-show-all) ;; Hide-show - show all
(global-set-key (kbd "C-c h b") 'hs-hide-block) ;; Hide-show - hide block
(global-set-key (kbd "C-c s b") 'hs-show-block) ;; Hide-show - show block
(global-set-key (kbd "C-c h s") 'hs-toggle-hiding) ;; Hide-show - toggle hiding
(global-set-key (kbd "C-c h m") 'hexl-mode) ;; Toggle hexl mode (hex-editor)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "C-c C-c") 'whitespace-cleanup)
(global-set-key (kbd "C-c k") 'counsel-ag)

;; Sound regulation
(exwm-input-set-key (kbd "<XF86AudioRaiseVolume>") '(lambda() (interactive) (minibuffer-message(shell-command-to-string "amixer -q sset Master 5%+"))))
(exwm-input-set-key (kbd "<XF86AudioLowerVolume>") '(lambda() (interactive) (minibuffer-message(shell-command-to-string "amixer -q sset Master 5%-"))))
(exwm-input-set-key (kbd "<XF86AudioMute>") '(lambda() (interactive) (minibuffer-message(shell-command-to-string "amixer -q sset Master toggle && amixer sget Master"))))

;; EXWM global keyboard bindings
(exwm-input-set-key (kbd "s-SPC") 'exwm-input-toggle-keyboard) ;; Toggle keyboard grabbing in current workspace
;; (exwm-input-set-key (kbd "M-s-SPC") '(lambda()
;; 									   (interactive)
;; 									   (minibuffer-message
;; 										(shell-command-to-string "setxkbmap -layout ru")
;; 										(message "%s" "RU")
;; 										))) ;; Globally set russian keyboard layout

;; (exwm-input-set-key (kbd "C-s-SPC") '(lambda()
;; 									   (interactive)
;; 									   (minibuffer-message
;; 										(shell-command-to-string "setxkbmap -layout us")
;; 										(message "%s" "US")
;; 										))) ;; Globally set usa keyboard layout

;; Quick launcher applications
(exwm-input-set-key (kbd "s-<return>") '(lambda () (interactive) (exwmx-shell-command "terminator"))) ;; Open terminal
(exwm-input-set-key (kbd "s-s s-m") '(lambda () (interactive) (exwmx-shell-command "terminator -x htop"))) ;; Open system monitor
(exwm-input-set-key (kbd "s-f s-m") '(lambda () (interactive) (exwmx-shell-command "terminator -x mc"))) ;; Open file manager
(exwm-input-set-key (kbd "s-p s-y") '(lambda () (interactive) (exwmx-shell-command "terminator -x python3"))) ;; Open python3 interpreter
(exwm-input-set-key (kbd "s-n s-m") '(lambda () (interactive) (exwmx-shell-command "terminator -x nmtui"))) ;; Open network manager
(exwm-input-set-key (kbd "s-a s-m") '(lambda () (interactive) (exwmx-shell-command "terminator -x alsamixer"))) ;; Open alsa mixer
(exwm-input-set-key (kbd "s-g s-c") '(lambda () (interactive) (exwmx-shell-command "google-chrome"))) ;; Open web-browser
(exwm-input-set-key (kbd "s-v s-b") '(lambda () (interactive) (exwmx-shell-command "virtualbox"))) ;; Open virtualbox
(exwm-input-set-key (kbd "s-s s-k") '(lambda () (interactive) (exwmx-shell-command "skypeforlinux"))) ;; Open skype
(exwm-input-set-key (kbd "s-t s-g") '(lambda () (interactive) (exwmx-shell-command "~/Programs/Telegram/Telegram"))) ;; Open telegram

(exwm-input-set-key (kbd "s-s 0") '(lambda () (interactive) (exwm-workspace-switch 0)))
(exwm-input-set-key (kbd "s-s 1") '(lambda () (interactive) (exwm-workspace-switch 1)))
(exwm-input-set-key (kbd "s-s 2") '(lambda () (interactive) (exwm-workspace-switch 2)))
(exwm-input-set-key (kbd "s-s 3") '(lambda () (interactive) (exwm-workspace-switch 3)))
(exwm-input-set-key (kbd "s-s 4") '(lambda () (interactive) (exwm-workspace-switch 4)))
(exwm-input-set-key (kbd "s-s 5") '(lambda () (interactive) (exwm-workspace-switch 5)))
(exwm-input-set-key (kbd "s-s 6") '(lambda () (interactive) (exwm-workspace-switch 6)))
(exwm-input-set-key (kbd "s-s 7") '(lambda () (interactive) (exwm-workspace-switch 7)))
(exwm-input-set-key (kbd "s-s 8") '(lambda () (interactive) (exwm-workspace-switch 8)))
(exwm-input-set-key (kbd "s-s 9") '(lambda () (interactive) (exwm-workspace-switch 9)))

(exwm-input-set-key (kbd "s-s w a") '(lambda () (interactive) (exwm-workspace-add)))

;; Window resize functions
(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
         (this-window-y-min (nth 1 win-edges))
         (this-window-y-max (nth 3 win-edges))
         (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
         (this-window-x-min (nth 0 win-edges))
         (this-window-x-max (nth 2 win-edges))
         (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((eq (+ fr-width 4) this-window-x-max) "right")
     (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
   (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
   (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(global-set-key (kbd "C-M-<up>") 'win-resize-enlarge-vert)
(global-set-key (kbd "C-M-<down>") 'win-resize-minimize-vert)
(global-set-key (kbd "C-M-<left>") 'win-resize-minimize-horiz)
(global-set-key (kbd "C-M-<right>") 'win-resize-enlarge-horiz)
(global-set-key (kbd "C-M-<up>") 'win-resize-enlarge-horiz)
(global-set-key (kbd "C-M-<down>") 'win-resize-minimize-horiz)
(global-set-key (kbd "C-M-<left>") 'win-resize-enlarge-vert)
(global-set-key (kbd "C-M-<right>") 'win-resize-minimize-vert)
(global-set-key (kbd "C-M-v") 'split-window-vertically)
(global-set-key (kbd "C-M-b") 'split-window-horizontally)

;; Show time
(setq display-time-default-load-average nil)
(display-time-mode t)

;; Show battery charge
;; (display-battery-mode 1)

;; Show column numbers
(column-number-mode 1)
(line-number-mode 1)

;; Show size
(size-indication-mode 1)

;; Set default config of emacs x window manager
(setq exwm-workspace-number 8)
(exwm-config-default)
(exwm-enable)
(exwm-cm-enable)
(exwm-systemtray-enable)
(setq exwmx-button-floating-button-line 'mode-line)

'(font-use-system-font t)

(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '( 0 "DP-2" 1 "DP-2" 2 "DP-1" 3 "DP-1" ))
(add-hook 'exwm-randr-screen-change-hook
        (lambda ()
          (start-process-shell-command
          "xrandr" nil "xrandr --output DP-2 --left-of DP-1 --auto")))
(exwm-randr-enable)

;; Setup org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
 
;; Google translate tuning
(require 'google-translate)
(require 'google-translate-smooth-ui)
(global-set-key (kbd "C-c t") 'google-translate-smooth-translate)

;; Instead screensaver
(defun lock-screen ()
  "Lock screen using (zone) and xtrlock
calls M-x zone on all frames and runs xtrlock"
  (interactive)
  (save-excursion
	(set-process-sentinel
     (start-process "xtrlock" nil "xtrlock")
     '(lambda (process event)
		(zone-leave-me-alone)))

	(shell-command-to-string "setxkbmap -layout us")
	(zone-when-idle 1)))

;; Screenlock key binding
(exwm-input-set-key (kbd "<f12>") 'lock-screen)

(setq org-agenda-files (list "~/Workspace/SUPPLNX.org"))

;; Make this file visible to emacs lisp interpreter
(provide 'init)
;;; .emacs ends here
