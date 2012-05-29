;; (defun local-column-number-mode ()
;;   (make-local-variable 'column-number-mode)
;;   (column-number-mode t))

;; (defun local-comment-auto-fill ()
;;   (set (make-local-variable 'comment-auto-fill-only-comments) t)
;;   (auto-fill-mode t))

;; (defun turn-on-hl-line-mode ()
;;   (if window-system (hl-line-mode t)))

;; (defun turn-on-save-place-mode ()
;;   (setq save-place t))

;; (defun turn-on-whitespace ()
;;   (whitespace-mode t))

;; (defun turn-on-paredit ()
;;   (paredit-mode t))

;; (defun turn-off-tool-bar ()
;;   (tool-bar-mode -1))

;; (defun add-watchwords ()
;;   (font-lock-add-keywords
;;    nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
;;           1 font-lock-warning-face t))))

;; (add-hook 'coding-hook 'local-column-number-mode)
;; (add-hook 'coding-hook 'local-comment-auto-fill)
;; (add-hook 'coding-hook 'turn-on-hl-line-mode)
;; (add-hook 'coding-hook 'turn-on-save-place-mode)
;; (add-hook 'coding-hook 'pretty-lambdas)
;; (add-hook 'coding-hook 'add-watchwords)

;; (defun run-coding-hook ()
;;   "Enable things that are convenient across all coding buffers."
;;   (run-hooks 'coding-hook))

;; (defun untabify-buffer ()
;;   (interactive)
;;   (untabify (point-min) (point-max)))

;; (defun indent-buffer ()
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; (defun cleanup-buffer ()
;;   "Perform a bunch of operations on the whitespace content of a buffer."
;;   (interactive)
;;   (indent-buffer)
;;   (untabify-buffer)
;;  (whitespace-cleanup))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; Cosmetic

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))



(defun regen-autoloads (&optional force-regen)
  "Regenerate the autoload definitions file if necessary and load it."
  (interactive "P")
  (let ((autoload-dir (concat live-root-dir "/elpa-to-submit"))
        (generated-autoload-file autoload-file))
    (when (or force-regen
              (not (file-exists-p autoload-file))
              (some (lambda (f) (file-newer-than-file-p f autoload-file))
                    (directory-files autoload-dir t "\\.el$")))
      (message "Updating autoloads...")
      (let (emacs-lisp-mode-hook)
        (update-directory-autoloads autoload-dir))))
  (load autoload-file))


(defun latexify-quotes ()
  "Replace fancy quote marks with their simpler counterparts. Useful when
   dealing with LaTeX documents"
  (interactive)
  (let ((st (region-beginning))
        (end (region-end)))
    (replace-string "‘" "`" nil st end)
    (replace-string "’" "'" nil st end)
    (replace-string "“" "\`\`" nil st end)
    (replace-string "”" "''" nil st end)))
