;; .new_emacs.d -> .emacs.d にリネームしたら次の2行を消す
;; cf. https://nasum.dev/2020/12/06/emacs-init-el-dev/
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

;; cf. http://blog.lambda-consulting.jp/2015/11/20/article/
(require 'org-install)
(defvar my-config-dir (concat user-emacs-directory "config-by-org/"))
(org-babel-load-file (expand-file-name "init.org" my-config-dir))
