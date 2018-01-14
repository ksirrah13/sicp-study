#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

;; (test 0 (p))
;; applicative-order eval = infinite loop
;; normal-order eval = 0
