;;; easylist-mode.el --- Major mode for Adblock/uBlock EasyList files -*- lexical-binding: t; -*-

;; Copyright (C) 2026 steckerhalter

;; Author: steckerhalter <https://github.com>
;; Version: 0.1.0
;; Keywords: languages, extensions
;; Package-Requires: ((emacs "24.4"))
;; URL: https://github.com/easylist-mode

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;;; Commentary:

;; This package provides native syntax highlighting, a basic syntax table,
;; and comment handling for Adblock Plus and uBlock Origin rule sheets
;; (EasyList syntax).

;;; Code:

(defgroup easylist nil
  "Syntax highlighting for Adblock/uBlock filter lists."
  :group 'languages
  :prefix "easylist-")

(defvar easylist-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; Define '!' as a comment starter and '\n' as a comment ender
    (modify-syntax-entry ?! "<" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for `easylist-mode'.")

(defvar easylist-font-lock-keywords
  `(;; Comments (handled by syntax table too, but enforced here)
    ("^!.*$" . font-lock-comment-face)

    ;; Exception/Whitelist Rules (Lines starting with @@)
    ("^@@.*$" . font-lock-constant-face)

    ;; Element Hiding Selectors (## for hide, #@# for exception)
    ("##.*$" . font-lock-function-name-face)
    ("#@#.*$" . font-lock-warning-face)

    ;; Domain modifiers and domain restricts (e.g., $domain=example.com)
    (,"\\$domain=[^, \n]+" . font-lock-string-face)

    ;; Rule options/modifiers at the end ($image, $script, $third-party)
    ("\\$[a-z0-9|-]+" . font-lock-variable-name-face)

    ;; Anchors and Separators (|| or ^ or |)
    ("\\|\\|" . font-lock-keyword-face)
    ("\\^" . font-lock-keyword-face))
  "Font lock keywords for `easylist-mode'.")

;;;###autoload
(define-derived-mode easylist-mode text-mode "EasyList"
  "Major mode for editing Adblock Plus and uBlock Origin filter rulesets."
  :group 'easylist
  :syntax-table easylist-mode-syntax-table

  (setq-local comment-start "!")
  (setq-local comment-end "")
  (setq-local comment-start-skip "!+ *")

  (setq font-lock-keywords easylist-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist '("easylist.*\\.txt\\'" . easylist-mode))

(provide 'easylist-mode)
;;; easylist-mode.el ends here
