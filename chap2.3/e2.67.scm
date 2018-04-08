#lang sicp
(#%require "../lib/ch2-shared.scm")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
;       ABCD
;       / \
;      A   BCD
;         /  \
;        B   CD
;           / \
;          D   C

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)
; {A D A B B C A}