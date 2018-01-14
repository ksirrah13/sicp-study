#lang sicp
(#%provide (all-defined))

;; Numbers
(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))