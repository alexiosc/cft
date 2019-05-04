;;; cftasm-mode.el   [plain text]
;;; cftasm-mode.el --- mode for editing assembler code

;; Copyright (C) 1991 Free Software Foundation, Inc.

;; Author: Eric S. Raymond <esr@snark.thyrsus.com>
;; Maintainer: FSF
;; Keywords: tools, languages

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This mode was written by Eric S. Raymond <esr@snark.thyrsus.com>,
;; inspired by an earlier cftasm-mode by Martin Neitzel.

;; This minor mode is based on text mode.  It defines a private abbrev table
;; that can be used to save abbrevs for assembler mnemonics.  It binds just
;; five keys:
;;
;;	TAB		tab to next tab stop
;;	:		outdent preceding label, tab to tab stop
;;	comment char	place or move comment
;;			asm-comment-char specifies which character this is;
;;			you can use a different character in different
;;			Asm mode buffers.
;;	C-j, C-m	newline and tab to tab stop
;;
;; Code is indented to the first tab stop level.

;; This mode runs two hooks:
;;   1) An cftasm-mode-set-comment-hook before the part of the initialization
;; depending on cftasm-comment-char, and
;;   2) an cftasm-mode-hook at the end of initialization.

;;; Code:

(defgroup asm nil
  "Mode for editing CFT assembler code."
  :group 'languages)

(defcustom cftasm-comment-char ?\;
  "*The comment-start character assumed by Asm mode."
  :type 'character
  :group 'cftasm-)

(defvar cftasm-mode-syntax-table nil
  "Syntax table used while in Asm mode.")

(defvar cftasm-mode-abbrev-table nil
  "Abbrev table used while in Asm mode.")
(define-abbrev-table 'cftasm-mode-abbrev-table ())

(defvar cftasm-mode-map nil
  "Keymap for Asm mode.")

(if cftasm-mode-map
    nil
  (setq cftasm-mode-map (make-sparse-keymap))
  ;; Note that the comment character isn't set up until cftasm-mode is called.
  (define-key cftasm-mode-map ":"		'cftasm-colon)
  ;(define-key cftasm-mode-map "-"		'cftasm-dash)
  (define-key cftasm-mode-map "\C-c;"      'comment-region)
  ;(define-key cftasm-mode-map "\C-i"	'tab-to-tab-stop)
  (define-key cftasm-mode-map "\C-j"	'cftasm-newline)
  (define-key cftasm-mode-map "\C-m"	'cftasm-newline)
  )

(defgroup cftasm nil
  "Mode for editing CFT Assembler code."
  :link '(custom-group-link :tag "Font Lock Faces group" font-lock-faces)
  :group 'languages)

(defgroup cftasm-faces nil
  "Faces used by gas-mode."
  :group 'cftasm)

(defface cftasm-label
  '((((class color) (background light)) (:foreground "maroon"))
    (t (:foreground "yellow")))
  "Face to use for CFT Assembler labels."
  :group 'cftasm-faces)

(defconst cftasm-instructions
  (concat "\\<"
	  (regexp-opt
	   (split-string "TRAP IOT LOAD STORE IN OUT JMP JSR ADD AND OR XOR
                          OP1 OP2 POP ISZ LIA JMPII IFL IFV CLA CLL NOT INC
                          CPL RBL RBR RNL RNR NOP SNA SZA SSL SSV SKIP SNN
                          SNZ SCL SCV CLI SEI SEL NEG ING LI SPA SNP RET RTT
                          RTI SBL SBR PUSH R I SMB"))
	  "\\>"))
	  
(defconst cftasm-preprocess-directives
  (concat "^[ \t]*\\."
	  (regexp-opt
	   ; .macro, .equ and .reg are handled separately
	   (split-string "macro end include pushns popns page bank equ scope endscope")
	   )
	  "[ \t]*"))

(defconst cftasm-assembly-directives
  (concat "[ \t]*"
	  (regexp-opt
	   ; .equ and .reg handled separately
	   (split-string ".word .data .str .strp .strn .fill .fillreg .longstring .compstring .endstring"))
	  "\\>"))
	  

(defconst cftasm-label
  "^\\(\\(\\sw\\|\\s_\\)+\\)\\>:?[ \t]*\\(\\sw+\\(\\.[lLwWbBsS]\\)?\\)?")

(defconst cftasm-keyword
  "^\\s +\\(\\(\\sw\\|\\s_\\)+\\(\\.[lLwWbBsS]\\)?\\)")

(defconst cftasm-font-lock-keywords
  (list
   (list "\\(%\\sw+\\|%{\\sw+}\\)" 1 font-lock-doc-face)
   (list cftasm-instructions 0 font-lock-keyword-face)
   (list "[ \t]*\\(\\.equ\\|\\.reg\\|\\.macro\\)[ \t]+\\([^ \t(]+\\)"
   	 '(1 font-lock-preprocessor-face) '(2 font-lock-variable-name-face))
   (list "[ \t]*\\([^ \t]+\\)[ \t]*(" 1 font-lock-function-name-face)
   (list cftasm-assembly-directives 0 font-lock-preprocessor-face)
   (list cftasm-preprocess-directives 0 font-lock-preprocessor-face)
   (list "^[ \t]*\\([^ \t]+:\\)?[ \t]*\\([^ \t]+\\)" 2 font-lock-type-face)
   (list cftasm-label '(1 font-lock-constant-face) '(3 font-lock-keyword-face nil t))
   (list "^[ \t]*\\(/+.*\\)" 1 font-lock-comment-face t)
   )
  "Additional expressions to highlight in Assembler mode.")

(defvar cftasm-code-level-empty-comment-pattern nil)
(defvar cftasm-flush-left-empty-comment-pattern nil)
(defvar cftasm-inline-empty-comment-pattern nil)

;;;###autoload
(defun cftasm-mode ()
  "Major mode for editing typical assembler code.
Features a private abbrev table and the following bindings:

\\[asm-colon]\toutdent a preceding label, tab to next tab stop.
\\[tab-to-tab-stop]\ttab to next tab stop.
\\[asm-newline]\tnewline, then tab to next tab stop.
\\[asm-comment]\tsmart placement of assembler comments.

The character used for making comments is set by the variable
`cftasm-comment-char' (which defaults to `?\\;').

Alternatively, you may set this variable in `cftasm-mode-set-comment-hook',
which is called near the beginning of mode initialization.

Turning on Asm mode runs the hook `cftasm-mode-hook' at the end of initialization.

Special commands:
\\{cftasm-mode-map}
"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "CFT Assembler")
  (set-fill-column 80)
  (setq comment-column 40)
  (setq code-column 16)
  (setq major-mode 'cftasm-mode)
  (setq local-abbrev-table cftasm-mode-abbrev-table)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(cftasm-font-lock-keywords))
  (make-local-variable 'cftasm-mode-syntax-table)
  (setq cftasm-mode-syntax-table (make-syntax-table))
  (set-syntax-table cftasm-mode-syntax-table)
  (setq indent-line-function 'cftasm-indent-line)

  (run-hooks 'cftasm-mode-set-comment-hook)
  ;; Make our own local child of cftasm-mode-map
  ;; so we can define our own comment character.
  (use-local-map (nconc (make-sparse-keymap) cftasm-mode-map))
  (local-set-key (vector cftasm-comment-char) 'cftasm-comment)

  (modify-syntax-entry	cftasm-comment-char
			"<" cftasm-mode-syntax-table)
  (modify-syntax-entry	?\n
			 ">" cftasm-mode-syntax-table)
  (let ((cs (regexp-quote (char-to-string cftasm-comment-char))))
    (make-local-variable 'comment-start)
    (setq comment-start (concat (char-to-string cftasm-comment-char) " "))
    (make-local-variable 'comment-start-skip)
    (setq comment-start-skip (concat cs "+[ \t]*"))
    (setq cftasm-inline-empty-comment-pattern (concat "^.+" cs "+ *$"))
    (setq cftasm-code-level-empty-comment-pattern (concat "^[\t ]+" cs cs " *$"))
    (setq cftasm-flush-left-empty-comment-pattern (concat "^" cs cs cs " *$"))
    )
  (make-local-variable 'comment-end)
  (setq comment-end "")
  ;(setq fill-prefix "\t")
  (run-hooks 'cftasm-mode-hook))

(defun cftasm-colon ()
  "Insert a colon; if it follows a label, delete the label's indentation."
  (interactive)
  (save-excursion
    (beginning-of-line)
    (if (looking-at "^[ \t]+\\(\\sw\\|\\s_\\)+$")
	(delete-horizontal-space)))
  (insert ":")
  (indent-to code-column)
  )

;; (defun cftasm-dash ()
;;   ""
;;   (interactive)
;;   (insert (number-to-string (cftasm-calculate-indentation))))

(defun cftasm-newline ()
  "Insert LFD + fill-prefix, to bring us back to code-indent level."
  (interactive)
  (if (eolp) (delete-horizontal-space))
  (if (cftasm-line-matches "^;;;\\( \\|$\\)")
      (insert "\n;;; ")
    (insert "\n")
    (indent-line-to (if (cftasm-line-matches "^[ \t]*$")
			code-column
		      (cftasm-calculate-indentation))))
)

(defun cftasm-line-matches (pattern &optional withcomment)
  (save-excursion
    (beginning-of-line)
    (looking-at pattern)))

(defun cftasm-pop-comment-level ()
  ;; Delete an empty comment ending current line.  Then set up for a new one,
  ;; on the current line if it was all comment, otherwise above it
  (end-of-line)
  (delete-horizontal-space)
  (while (= (preceding-char) cftasm-comment-char)
    (delete-backward-char 1))
  (delete-horizontal-space)
  (if (bolp)
      nil
    (beginning-of-line)
    (open-line 1))
  )


(defun cftasm-comment ()
  "Convert an empty comment to a `larger' kind, or start a new one.
These are the known comment classes:

   1 -- comment to the right of the code (at the comment-column)
   2 -- comment on its own line, indented like code
   3 -- comment on its own line, beginning at the left-most column.

Suggested usage:  while writing your code, trigger cftasm-comment
repeatedly until you are satisfied with the kind of comment."
  (interactive)
  (cond

   ;; Blank line?  Then start comment at code indent level.
   ((cftasm-line-matches "^[ \t]*$")
    (delete-horizontal-space)
    (indent-to code-column)
    (insert cftasm-comment-char comment-start))

   ;; Nonblank line with no comment chars in it?
   ;; Then start a comment at the current comment column
   ((cftasm-line-matches (format "^[^%c\n]+$" cftasm-comment-char))
    (indent-for-comment))

   ;; Flush-left comment present?  Just insert character.
   ((cftasm-line-matches cftasm-flush-left-empty-comment-pattern)
    (insert cftasm-comment-char))

   ;; Empty code-level comment already present?
   ;; Then start flush-left comment, on line above if this one is nonempty. 
   ((cftasm-line-matches cftasm-code-level-empty-comment-pattern)
    (cftasm-pop-comment-level)
    (insert cftasm-comment-char cftasm-comment-char comment-start))

   ;; Empty comment ends line?
   ;; Then make code-level comment, on line above if this one is nonempty. 
   ((cftasm-line-matches cftasm-inline-empty-comment-pattern)
    (cftasm-pop-comment-level)
    (indent-to code-column)
    (insert cftasm-comment-char comment-start))

   ;; If all else fails, insert character
   (t
    (insert cftasm-comment-char))

   )
  (end-of-line))

(defun cftasm-indent-line ()
  "Indent current line of CFT Assembly."
  (interactive)
  (if (not (cftasm-line-matches "^\\([;/]\\|[ \t]*$\\)"))
      (let ((savep (> (current-column) (current-indentation)))
	    (indent (condition-case nil (max (cftasm-calculate-indentation) 0)
		      (error 0))))
	(if savep
	    (save-excursion (indent-line-to indent))
	  (indent-line-to indent)))))
  
(defun cftasm-calculate-indentation ()
   "Return the column to which the current line should be indented."
   (interactive)
   (cond
    ((cftasm-line-matches cftasm-preprocess-directives) 0) ; preprocessor directives
    ((cftasm-line-matches "^[ \t]*[^ \t\n]*[ \t]*:") 0) ; label
    ((cftasm-line-matches "^\\(;;;+\\|///+\\)") 0) ; line comment
    ((cftasm-line-matches "^;;[^;]") code-column) ; paragraph comment
    ((cftasm-line-matches "^;[^;]") comment-column) ; code comment
    (t code-column)
   ))

(provide 'cftasm-mode)

;;; cftasm-mode.el ends here
