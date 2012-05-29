;;make evil tabs visible as arrows
(let ((d (make-display-table)))
  (aset d 9 (vector ?→ ? ))
  (set-window-display-table nil d))

;; (custom-set-variables
;;      '(term-default-bg-color "#000000")        ;; background color (black)
;;      '(term-default-fg-color "#dddd00"))       ;; foreground color (yellow)
