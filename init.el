
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-archives
  '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
 
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
    t
    (if (or (assoc package package-archive-contents) no-refresh)
      (if (boundp 'package-selected-packages)
        ;; Record this as a package the user installed explicitly
        (package-install package nil)
        (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))
(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
    (require-package package min-version no-refresh)
    (error
      (message "Couldn't install optional package `%s': %S" package err)
      nil)))

;; Package list
(require-package 'evil)
(require-package 'evil-leader)
(require-package 'company)
(require-package 'company-quickhelp)

(when (maybe-require-package 'evil)
  (evil-mode 1))
  
(when (maybe-require-package 'evil-leader)
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
   ))

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook'global-company-mode))
(when (maybe-require-package 'company-quickhelp)
  (add-hook 'after-init-hook'company-quickhelp-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (company-quickhelp company evil-leader evil))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;中文与外文字体设置
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(set-font   "Menlo" "Kaiti TC" 15 15)

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
;; (set-face-attribute 'default nil :height 160)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)


(setq evil-insert-state-cursor 'bar)
