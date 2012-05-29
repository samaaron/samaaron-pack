;;PATH stuff
(push "/usr/local/bin" exec-path)
(setq path "/Applications/Supercollider:/Users/sam/bin:/usr/local/bin:$PATH:/bin:/usr/bin")
(setenv "PATH" path)
(push "/Applications/SuperCollider" exec-path)

;;organise ibuffer into handy groups
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("IRC"      (mode . erc-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")
                         (name . "^\\*Completions\\*$")
                         (filename . ".emacs.d")))

               ("improcess apps"  (filename . "Development/improcess/apps"))
               ("improcess lib"   (filename . "Development/improcess/lib"))
               ("dired" (mode . dired-mode))

               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))


;;projects
(project-def "overtone"
             '((basedir          "/Users/sam/Development/improcess/lib/overtone")
               (src-patterns     ("*.clj"))
               (ignore-patterns  ("*.log" "*#"))
               (file-list-cache  "/Users/sam/.emacs.d/tmp/mk-project-cache/overtone-files")
               (open-files-cache "/Users/sam/.emacs.d/tmp/mk-project-cache/overtone-open-files")
               (vcs              git)
               (ack-args         "--clojure")
               (shutdown-hook    nil)))
