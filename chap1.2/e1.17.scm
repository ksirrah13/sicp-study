#lang sicp
(#%require "../lib/ch1-shared.scm")

; fast iterative mult
(define (fast-mult a b)
  (define (fast-mult-iter a b result)
    (cond ((< b 1) result)
          ((even? b) (fast-mult-iter (double a) (half b) result))
          (else (fast-mult-iter a (- b 1) (+ result a)))))
  (fast-mult-iter a b 0))

(fast-mult 4 3)
; 12
