;;; ddavis-python.el --- python configuration        -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Doug Davis

;; Author: Doug Davis <ddavis@ddavis.io>
;; Keywords: local

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; personal python setup

;;; Code:

(require 'use-package)

(use-package pyvenv
  :ensure t
  :config
  (setenv "WORKON_HOME" "~/.pyenv/versions"))

(use-package elpy
  :ensure t)

(use-package blacken
  :ensure t)

(defun ddavis/blacken-96 ()
  (interactive)
  (setq blacken-line-length 96))

(defun ddavis/python-eglot-enable ()
  "prepare python eglot setup"
  (interactive)
  (use-package eglot
    :ensure t
    :config
    (require 'eglot))
  (setq company-backends (cons 'company-capf (remove 'company-capf company-backends)))
  (add-to-list 'eglot-server-programs '(python-mode . ("pyls"))))

(defun ddavis/py-activate (env-name)
  (require 'pyvenv)
  (interactive "sEnv name: ")
  (message env-name)
  (pyvenv-activate (format "~/.pyenv/versions/%s" env-name)))

(defun ddavis/py-tdub ()
  (interactive)
  (ddavis/py-activate "tdub"))

(provide 'ddavis-python)
;;; ddavis-python.el ends here