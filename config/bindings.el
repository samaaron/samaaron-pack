(require 'key-chord)
(key-chord-mode 1)

;;make C-] and M-] cut and copy respectively
(global-set-key (kbd "C-]") 'kill-region)
(global-set-key (kbd "M-]") 'kill-ring-save)

;;mark current function
(global-set-key (kbd "C-x C-p")     'mark-defun)

;;remove whitespace between point and next word
(global-set-key (kbd "C-c k")     'whack-whitespace)
(global-set-key (kbd "C-c C-k")   'whack-whitespace)

;;make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)
(define-key paredit-mode-map (kbd "C-h") 'paredit-backward-delete)

;;redefine help shortcut
(global-set-key (kbd "M-§") 'help-command)

;;allow the deletion of words:
;;backward kill word (forward kill word is M-d)
(global-set-key (kbd "C-w") 'backward-kill-word)
(define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)

;;paredit
(define-key paredit-mode-map (kbd "C-M-e") 'paredit-backward-barf-sexp)
(define-key paredit-mode-map (kbd "C-M-s") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-M-j") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-M-y") 'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "C-c l k") 'paredit-splice-sexp-killing-forward)
(define-key paredit-mode-map (kbd "C-c l w") 'paredit-splice-sexp-killing-backward)
(define-key paredit-mode-map (kbd "C-c l l") 'align-cljlet)
(define-key paredit-mode-map (kbd "C-c l t") 'fill-paragraph)
(define-key paredit-mode-map (kbd "C-M-z") 'align-cljlet)
(define-key paredit-mode-map (kbd "M-s") 'paredit-split-sexp)
(define-key paredit-mode-map (kbd "M-j") 'paredit-join-sexps)


;;C-c handy shortcuts
;;l - lispy shortcuts (i.e. paredit and clojure specific fns)
;;m - emacs eval shortcuts
;;s - slime eval shortcuts
;;t - text manipulation shortcuts
;;i - utf8 char shortcuts
;;j - quick-jump shortcuts
;;d - diff shortcuts
;;p - project shortcuts

;;text manipulation shortcuts
(global-set-key (kbd "C-c t b")     'untabify-buffer)
(global-set-key (kbd "C-c t r")     'untabify)

;;C-c C-? bindings
(global-set-key (kbd "C-c C-e")   'slime-eval-last-expression)

;;emacs-lisp shortcuts
(global-set-key (kbd "C-c m s")     'eval-and-replace) ;swap
(global-set-key (kbd "C-c m b")     'eval-buffer)
(global-set-key (kbd "C-c m e")     'eval-last-sexp)
(global-set-key (kbd "C-c m i")     'eval-expression)
(global-set-key (kbd "C-c m d")     'eval-defun)
(global-set-key (kbd "C-c m n")     'eval-print-last-sexp)
(global-set-key (kbd "C-c m r")     'eval-region)

;;slime mode shortcuts
(global-set-key (kbd "C-c s c")     'slime-connect)
(global-set-key (kbd "C-c s e e")   'slime-eval-last-expression)
(global-set-key (kbd "C-c s e b")   'slime-eval-buffer)
(global-set-key (kbd "C-c s e i")   'slime-eval-describe)
(global-set-key (kbd "C-c s e a")   'slime-eval-async)
(global-set-key (kbd "C-c s e d")   'slime-eval-defun)
(global-set-key (kbd "C-c s e f")   'slime-eval-feature-expression)
(global-set-key (kbd "C-c s e l")   'slime-eval-for-lisp)
(global-set-key (kbd "C-c s e m")   'slime-eval-macroexpand-inplace)
(global-set-key (kbd "C-c s e n")   'slime-eval-print-last-expression)
(global-set-key (kbd "C-c s e r")   'slime-eval-region)
(global-set-key (kbd "C-c s e t")   'slime-eval-with-transcript)

;;funky characters
(global-set-key (kbd "C-c i l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "C-c i n") (lambda () (interactive) (insert "ℕ")))
(global-set-key (kbd "C-c i i") (lambda () (interactive) (insert "∞")))
(global-set-key (kbd "C-c i .") (lambda () (interactive) (insert "×")))
(global-set-key (kbd "C-c i 0") (lambda () (interactive) (insert "∅")))
(global-set-key (kbd "C-c i u") (lambda () (interactive) (insert "∪")))
(global-set-key (kbd "C-c i s") (lambda () (interactive) (insert "♯")))
(global-set-key (kbd "C-c i p") (lambda () (interactive) (insert "£")))

(global-set-key (kbd "C-c j p") 'quick-jump-go-back)
(global-set-key (kbd "C-c j b") 'quick-jump-go-back)
(global-set-key (kbd "C-c j m") 'quick-jump-push-marker)
(global-set-key (kbd "C-c j n") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j f") 'quick-jump-go-forward)
(global-set-key (kbd "C-c j c") 'quick-jump-clear-all-marker)
(key-chord-define-global "\\j"  'quick-jump-push-marker)

;;diff shortcuts
(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)

;;mk-project shortcuts
(global-set-key (kbd "C-c p l") 'project-load)
(global-set-key (kbd "C-c p u") 'project-unload)
(global-set-key (kbd "C-c p c") 'project-compile)
(global-set-key (kbd "C-c p g") 'project-grep)
(global-set-key (kbd "C-c p a") 'project-ack)
(global-set-key (kbd "C-c p o") 'project-multi-occur)
(global-set-key (kbd "C-c p f") 'project-find-file-ido)
(global-set-key (kbd "C-c p i") 'project-index)
(global-set-key (kbd "C-c p t") 'project-tags)
(global-set-key (kbd "C-c p d") 'project-dired)
(global-set-key (kbd "C-c p s") 'project-status)

;;delete current word
(global-set-key (kbd "M-w") (lambda () (interactive) (backward-word) (kill-word 1)))

;;kill regions
(global-set-key (kbd "C-x C-k") 'kill-region)

;;shrink and grow windows horizontally and vertically
(global-set-key (kbd "C-c .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c '") (lambda () (interactive) (enlarge-window 1)))

;;set the mark
(global-set-key (kbd "C-SPC") 'set-mark-command)

;;repeat previous command
(global-set-key (kbd "C-v") 'repeat)

;;scroll other window
(global-set-key (kbd "C-M-]") 'scroll-other-window)
(global-set-key (kbd "C-M-[") 'scroll-other-window-down)

(global-set-key (kbd "C-c w s") 'swap-windows)
(global-set-key (kbd "C-c w r") 'rotate-windows)

;;requires buffer-move
(global-set-key (kbd "C-c w p")  'buf-move-up)
(global-set-key (kbd "C-c w n")  'buf-move-down)
(global-set-key (kbd "C-c w b")  'buf-move-left)
(global-set-key (kbd "C-c w f")  'buf-move-right)

;;fast vertical naviation
(global-set-key  (kbd "M-P") (lambda () (interactive) (previous-line 10)))
(global-set-key  (kbd "M-N") (lambda () (interactive) (next-line 10)))
(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;;requires cua-mode for rectangle selection
(global-set-key (kbd "§") 'cua-set-rectangle-mark)

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Window switching.
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(global-set-key (kbd "M-v")  'yank)
(global-set-key (kbd "C-M-_") 'undo-tree-undo)

(global-set-key (kbd "C-c b") 'winner-undo)
(global-set-key (kbd "C-c f") 'winner-redo)

(define-key grep-mode-map (kbd "s") (lambda () (interactive) (previous-error-no-select) (next-error-no-select)))
(define-key grep-mode-map (kbd "S") (lambda () (interactive) (next-error-no-select) (previous-error-no-select)))

(key-chord-define-global "\\s" 'ido-goto-symbol)

;; Ace jump mode
(global-set-key (kbd "C-o") 'ace-jump-mode)
