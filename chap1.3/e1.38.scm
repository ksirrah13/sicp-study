#lang sicp
(#%require "../shared.scm")

(define (euler-cf k)
  (define (n k) 1)
  (define (d k)
    (if (= (remainder (inc k) 3) 0)
        (* 2 (+ 1 (quotient k 3)))
        1))
  (+ 2.0 (cont-frac n d k)))

(euler-cf 10)
; 2.7182817182817183