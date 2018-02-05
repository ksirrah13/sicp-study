#lang sicp

(define (last-pair l)
  (cond ((null? l) nil)
        ((null? (cdr l)) l)
        (else (last-pair (cdr l)))))

(last-pair (list 23 72 149 34))
; {34}
