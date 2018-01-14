#lang sicp
(#%require "../lib/ch1-shared.scm")

; faster iterative mult
(define (faster-mult a b)
  (define (faster-mult-iter a b result)
    (cond ((< b 1) result)
          ((even? b) (faster-mult-iter (double a) (half b) result))
          (else (faster-mult-iter (double a) (half (- b 1)) (+ result a)))))
  (faster-mult-iter a b 0))

(faster-mult 3 4)
