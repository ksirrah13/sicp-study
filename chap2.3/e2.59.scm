#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (adjoin-set (car set1)
                          (union-set (cdr set1) set2)))))

(union-set '(1 2 3 4) '(2 4 6 8))
; {1 3 2 4 6 8}