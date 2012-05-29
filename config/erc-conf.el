(setq freenode-pass nil) ;; place a copy of this line in ~/.ercpass with correct password
(load "~/.ercpass")
(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
      `((freenode     (("samaaron" . ,freenode-pass)))))

;;IRC
(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#clojure" "#overtone" "#leiningen" "#quil" "#supercollider")))

(defun erc-connect ()
  "Start up erc and connect to freedonde"
  (interactive)
  (erc :server "irc.freenode.net" :full-name "Sam Aaron" :port 6667 :nick "samaaron"))

(require 'erc-match)
(setq erc-keywords '("samaaron" "overtone" "osc-clj" "supercollider" "monome" "touchosc"))
(erc-match-mode)

(defun growl (title message)
  "Shows a message through the growl notification system using
 `growlnotify-command` as the program."
  (flet ((encfn (s) (encode-coding-string s (keyboard-coding-system))) )
    (let* ((process (start-process "growlnotify" nil
                                   growlnotify-command
                                   (encfn title)
                                   "-a" "Emacs"
                                   "-n" "Emacs")))
      (process-send-string process (encfn message))
      (process-send-string process "\n")
      (process-send-eof process)))
  t)

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (unless (posix-string-match "^\\** *Users on #" message)
    (growl
     (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
     message
     )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)

;;change wrap width when window is resized
(make-variable-buffer-local 'erc-fill-column)
 (add-hook 'window-configuration-change-hook
           '(lambda ()
              (save-excursion
                (walk-windows
                 (lambda (w)
                   (let ((buffer (window-buffer w)))
                     (set-buffer buffer)
                     (when (eq major-mode 'erc-mode)
                       (setq erc-fill-column (- (window-width w) 2)))))))))
