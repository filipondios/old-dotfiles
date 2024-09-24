;; Disable all that backups!
;; Im going to risk it all.
(setq make-backup-files nil
      auto-save-default nil
      delete-old-versions t)

;; Instead of a beep sound, make some
;; window effect at warnings.
(setq visible-bell t)

;; Show line numbers
(setq display-line-numbers t)
(global-display-line-numbers-mode t)
