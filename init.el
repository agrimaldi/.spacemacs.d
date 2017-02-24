;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-complete-with-key-sequence nil
                      )
     dash
     emacs-lisp
     ess
     extra-langs
     (git :variables
          )
     ipython-notebook
     markdown
     (org :variables
          org-enable-github-support t
          )
     osx
     pandoc
     ;; (perspectives :variables
     ;;               perspective-enable-persp-projectile t
     ;;               )
     (python :variables
             python-test-runner 'pytest
             )
     (ranger :variables
             ranger-show-preview t)
     (shell :variables
            shell-default-height 40
            shell-default-position 'bottom
            )
     (spell-checking :variables
                     enable-flyspell-auto-completion t
                     )
     syntax-checking
     themes-megapack
     version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(
     autothemer
     ;; multiple-cursors
     sublimity
     ;; minimap
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         ;; gruvbox
                         ;; darktooth
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("PragmataPro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.5
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("pt" "ag" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."

  ;; Keep server alive
  (setq-default dotspacemacs-persistent-server t)

  ;; (setq initial-frame-alist '((top . 0) (left . 822) (width . 135) (height . 60)))

  (load-file "~/.spacemacs.d/private/local/autothemer.el")

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (load-theme 'darktooth t)

  ;; Sublimity
  (require 'sublimity)
  ;; (require 'sublimity-scroll)
  (require 'sublimity-map)
  (sublimity-map-set-delay 0.3)
  ;; (require 'sublimity-attractive)
  ;; (setq minimap-window-location 'right)

  ;; (require 'multiple-cursors)
  (global-evil-mc-mode 1)

  ;; Make linums relative by default
  (global-linum-mode nil)
  (linum-relative-toggle)

  (global-company-mode)

  ;; Snippet completion on <tab>
  (global-set-key (kbd "TAB") 'hippie-expand)

  ;; Disable trailing-whitespace highlighting
  (setq spacemacs-show-trailing-whitespace nil)

  ;; inline images in orgmode
  (setq org-startup-with-inline-images t)

  ;; Forever blinking cursor
  (blink-cursor-mode 1)

  ;; magit auto-refresh on save
  ;; (add-hook 'after-save-hook 'magit-after-save-refresh-status)

  ;; Text selection color
  (set-face-attribute 'hl-line nil :foreground nil :background "gray5")

  ;; Current line background color
  (set-face-background 'hl-line "#3e4446")

  ;; Org-mode code execution
  (with-eval-after-load 'org
    (setq org-startup-indented t)
    (setq org-clock-idle-time 15)

    ;; todos
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
                  (sequence "WAITING(w)" "HOLD(h)" "|" "CANCELLED(c)"))))
    (setq org-todo-keyword-faces
          '(("TODO" . (:foreground "red" :weight bold))
            ("NEXT" . (:foreground "orange" :weight bold))
            ("STARTED" . (:foreground "yellow" :weight bold))
            ("WAITING" . (:foreground "lightblue" :weight bold))
            ("HOLD" . (:foreground "lightblue" :weight bold))
            ("CANCELLED" . (:foreground "grey" :weight bold))
            ))
    (setq org-src-fontify-natively t)
    (setq org-src-tab-acts-natively t)
    (require 'ob-python)
    (require 'ob-sh)
    (require 'ob-shell)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((shell . t)
       (python . t)
       (sh         . t)
       (js         . t)
       (emacs-lisp . t)
       (clojure    . t)
       (dot        . t)
       ))


    )


  (defun org-babel-async-execute:sh ()
    "Execute the python src-block at point asynchronously.
      :var headers are supported.
      :results output is all that is supported for output.

      A new window will pop up showing you the output as it appears,
      and the output in that window will be put in the RESULTS section
      of the code block."
    (interactive)
    (let* ((current-file (buffer-file-name))
           (uuid (org-id-get-create))
           (code (org-element-property :value (org-element-context)))
           (temporary-file-directory ".")
           (tempfile (make-temp-file "py-"))
           (pbuffer (format "*%s*" uuid))
           (varcmds (org-babel-variable-assignments:sh
                     (nth 2 (org-babel-get-src-block-info))))
           process)

      ;; get rid of old results, and put a place-holder for the new results to
      ;; come.
      (org-babel-remove-result)

      (save-excursion
        (re-search-forward "#\\+END_SRC")
        (insert (format
                 "\n\n#+RESULTS: %s\n: %s"
                 (or (org-element-property :name (org-element-context))
                     "")
                 uuid)))

      ;; open the results buffer to see the results in.
      (switch-to-buffer-other-window pbuffer)

      ;; Create temp file containing the code.
      (with-temp-file tempfile
        ;; if there are :var headers insert them.
        (dolist (cmd varcmds)
          (insert cmd)
          (insert "\n"))
        (insert code))

      ;; run the code
      (setq process (start-process
                     uuid
                     pbuffer
                     "zsh"
                     tempfile))

      ;; when the process is done, run this code to put the results in the
      ;; org-mode buffer.
      (set-process-sentinel
       process
       `(lambda (process event)
          (save-window-excursion
            (save-excursion
              (save-restriction
                (with-current-buffer (find-file-noselect ,current-file)
                  (goto-char (point-min))
                  (re-search-forward ,uuid)
                  (beginning-of-line)
                  (kill-line)
                  (insert
                   (mapconcat
                    (lambda (x)
                      (format "| %s |" x))
                    (butlast (split-string
                              (with-current-buffer
                                  ,pbuffer
                                (buffer-string))
                              "\n"))
                    "\n"))))))
          ;; delete the results buffer then delete the tempfile.
          ;; finally, delete the process.
          (when (get-buffer ,pbuffer)
            (kill-buffer ,pbuffer)
            (delete-window))
          (delete-file ,tempfile)
          (delete-process process)))))


  (defun org-babel-execute:sh (body params)
    "Execute a block of Shell commands with Babel.
    This function is called by `org-babel-execute-src-block'."
    (let* ((session (org-babel-sh-initiate-session
                     (cdr (assoc :session params))))
           (async (assoc :async params))
           (stdin (let ((stdin (cdr (assoc :stdin params))))
                    (when stdin (org-babel-sh-var-to-string
                                 (org-babel-ref-resolve stdin)))))
           (full-body (org-babel-expand-body:generic
                       body params (org-babel-variable-assignments:sh params))))
      (if async
          ;; run asynchronously
          (org-babel-async-execute:sh)
        ;; else run regularly
        (org-babel-reassemble-table
         (org-babel-sh-evaluate session full-body params stdin)
         (org-babel-pick-name
          (cdr (assoc :colname-names params)) (cdr (assoc :colnames params)))
         (org-babel-pick-name
          (cdr (assoc :rowname-names params)) (cdr (assoc :rownames
                                                          params)))))))


  ;; Python path for local testing
  (setenv "PYTHONPATH" ".:/opt/anaconda/lib/python2.7/site-packages")
  ;; (global-company-mode)

  ;; Copy hunks from both A and B when resolving merge conflicts in ediff
  (defun ediff-copy-both-to-C ()
    (interactive)
    (ediff-copy-diff ediff-current-difference nil 'C nil
                     (concat
                      (ediff-get-region-contents ediff-current-difference 'A ediff-control-buffer)
                      (ediff-get-region-contents ediff-current-difference 'B ediff-control-buffer))))
  (defun add-d-to-ediff-mode-map () (define-key ediff-mode-map "d" 'ediff-copy-both-to-C))
  (add-hook 'ediff-keymap-setup-hook 'add-d-to-ediff-mode-map)

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol t)
 '(org-agenda-files
   (quote
    ("~/mpi/Kc167_2016-01-26_dCTCF-20HE_NextSeq/README.org")))
 '(package-selected-packages
   (quote
    (ox-gfm zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme fish-mode ein websocket flyspell-popup minimap sublimity wolfram-mode thrift stan-mode scad-mode qml-mode matlab-mode arduino-mode insert-shebang company-shell org yapfify uuidgen py-isort osx-dictionary org-projectile org-download live-py-mode link-hint hide-comnt git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump column-enforce-mode spinner parent-mode request gitignore-mode fringe-helper git-gutter+ epl flx highlight ctable pos-tip pythonic s popup bind-map xterm-color window-numbering spacemacs-theme spaceline ranger persp-mode pandoc-mode orgit org-pomodoro alert org-plus-contrib neotree markdown-toc markdown-mode magit-gitflow leuven-theme hl-todo helm-projectile helm-make projectile helm-descbinds helm-dash helm-c-yasnippet helm-ag google-translate git-messenger expand-region exec-path-from-shell evil-mc evil-matchit evil-magit magit magit-popup evil-exchange eshell-prompt-extras diff-hl company-quickhelp company-anaconda auto-yasnippet yasnippet auto-compile anaconda-mode ace-link auto-complete avy ess julia-mode anzu iedit smartparens flycheck git-gutter git-commit with-editor company helm helm-core ht hydra f dash quelpa package-build use-package which-key evil yaml-mode ws-butler volatile-highlights vi-tilde-fringe undo-tree toc-org smooth-scrolling smeargle shell-pop reveal-in-osx-finder restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-yapf powerline popwin pkg-info pip-requirements pcre2el pbcopy paradox page-break-lines packed ox-pandoc osx-trash org-repo-todo org-present org-bullets open-junk-file multi-term move-text mmm-mode macrostep lorem-ipsum log4e linum-relative launchctl info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-mode-manager helm-gitignore helm-flyspell helm-flx helm-company gruvbox-theme goto-chg golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-timemachine git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-lisp-state evil-indent-plus evil-iedit-state evil-escape evil-args evil-anzu eval-sexp-fu ess-smart-equals ess-R-object-popup ess-R-data-view esh-help elisp-slime-nav diminish define-word dash-at-point cython-mode company-statistics clean-aindent-mode buffer-move bracketed-paste bind-key auto-highlight-symbol auto-dictionary async aggressive-indent adaptive-wrap ace-window ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
