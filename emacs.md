(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 (set-default-font "Menlo-15"))


;;
;; My personal settings
;;
;; Org-mode settings
(setq org-agenda-files '("~/Documents/tracker"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; clock settings
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;;todo
(setq org-enforce-todo-dependencies t)
(setq org-todo-keywords
      '((sequence "TODO(t)"  "|" "DONE(d!)" "CANCEL(c!)")))

;; open the .emacs file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; delete the clr
(delete-file "~/Library/Colors/Emacs.clr")

;; Todo status
(setq-default kill-whole-line t)

;; org capture
;; (setq org-default-notes-file (concat org-directory "~/notes.org"))
(global-set-key (kbd "\C-c c") 'org-capture)

(setq org-capture-templates
   '(("j" "Journal" entry (file+datetree "~/journal.org")
      "* %?\n @： %U\n  %i\n  %a")))

;; fullscreen settings
(add-to-list 'default-frame-alist '(fullscreen . maximized))
