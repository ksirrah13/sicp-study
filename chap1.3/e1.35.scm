#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (golden)
  (define (golden-f x)
    (+ 1 (/ 1.0 x)))
  (fixed-point golden-f 1))

(golden)
; 1.6180327868852458
