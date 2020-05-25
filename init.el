
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages (quote (evil-leader evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;
;; My personal settings
;;
;; Org-mode settings
(setq org-agenda-files '("~/Documents/org/gtd.org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; clock settings
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;todo
(setq org-enforce-todo-dependencies t)
(setq org-todo-keywords
      '((sequence "TODO(t)"  "|" "DONE(d!)" "CANCEL(c!)")))

;; delete the clr
(delete-file "~/Library/Colors/Emacs.clr")

;; Todo status
(setq-default kill-whole-line t)

;; org capture
;; (setq org-default-notes-file (concat org-directory "~/notes.org"))
(global-set-key (kbd "\C-c c") 'org-capture)

(setq org-capture-templates
   '(("t" "Todo" entry (file+headline "~/Documents/org/gtd.org" "Workspace")
          "* TODO [#B]  %?\n  %i\n ")
     ("j" "Journal" entry (file+datetree "~/Documents/org/journal.org")
          "* %?\nEntered on: %U\n  %i\n %a")))

;; fullscreen settings
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (setq split-width-threshold 0)

;; zilongshanren
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode nil)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; (global-company-mode 1)


(setq evil-insert-state-cursor 'bar)

(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)
(require 'evil)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )
(evil-mode 1)
