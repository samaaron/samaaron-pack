(defun overtone-stop ()
  (interactive)
  (slime-eval-async `(swank:eval-and-grab-output "(in-ns 'overtone.sc.server) (stop)")))
