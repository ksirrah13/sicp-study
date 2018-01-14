#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (tan-cf x k)
  (define (n k)
    (if (= k 1)
        x
        (square x)))
  (define (d k)
    (- (* 2 k) 1))
  (cont-frac-gen n d - k))

(tan-cf 2.0 10)
; -2.1850398632626273
