#lang sicp
(#%provide (all-defined))

(define (square x)
  (* x x))

(define (average x y)
    (/ (+ x y) 2))

(define (half x)
  (/ x 2))

(define (double x)
  (+ x x))

(define (divide? a b)
  (= (remainder b a) 0))
