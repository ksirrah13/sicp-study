#lang sicp

(define (sum term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (+ (term cur) result))))
    (iter a 0))

(sum identity 0 inc 10)
; 55
  