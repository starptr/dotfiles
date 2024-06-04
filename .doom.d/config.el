;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Yuto Nishida"
      user-mail-address "yuyu.nishida@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 14 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Arial" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(defun toggle-theme ()
  (interactive)
  (if (eq (symbol-value 'doom-theme) 'doom-one)
      (load-theme 'doom-one-light t)
    (load-theme 'doom-one t)))
(evil-ex-define-cmd "theme" #'toggle-theme)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

                                        ; Remove $HOME as project root
(after! projectile (setq projectile-project-root-files-bottom-up (remove ".git" projectile-project-root-files-bottom-up)))

                                        ; Remap s to evil
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

                                        ; No confirm on exit
(setq confirm-kill-emacs nil)

                                        ; Add ctrl-direction keybinds
                                        ;(map! "C-h" #'evil-window-left)
                                        ;(map! "C-j" #'evil-window-down)
                                        ;(map! "C-k" #'evil-window-up)
                                        ;(map! "C-l" #'evil-window-right)

                                        ; Set ddskk as alternate
(setq default-input-method 'japanese-skk)

                                        ; Location of projects
(setq projectile-project-search-path '("~/src" "~/Documents/GitHub"))

                                        ; Set clangd args
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(setq scroll-conservatively 101 ; important!
      scroll-margin 0)
(ultra-scroll-mac-mode 1)
