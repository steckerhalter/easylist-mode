# easylist-mode.el

An Emacs major mode providing native syntax highlighting and comment handling for Adblock Plus and uBlock Origin rule sheets (**EasyList** format).

## Features
- **Full Syntax Highlighting:** Clear distinction for comments, rule exceptions, element hiding selectors, and specific domain modifiers.
- **Native Comment Support:** Integrates seamlessly with standard Emacs comment behaviors like `M-;` (`comment-dwim`).

## Installation

### Manual Installation
Drop `easylist-mode.el` into your Emacs `load-path` (e.g., `~/.emacs.d/lisp/`), then add the following to your configuration:

```elisp
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'easylist-mode)
```

### Using Elpaca
```elisp
(use-package easylist-mode
  :ensure (:host github :repo "steckerhalter/easylist-mode"))
```

### Using Straight.el
```elisp
(use-package easylist-mode
  :straight (easylist-mode :type git :host github :repo "steckerhalter/easylist-mode"))
```

### Using Quelpa
```elisp
(quelpa '(easylist-mode :repo "steckerhalter/easylist-mode" :fetcher github))
```

## License
This project is licensed under the GNU General Public License v3.0 or later.
