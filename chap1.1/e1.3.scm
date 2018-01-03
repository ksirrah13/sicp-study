#lang sicp

(define (largest-sum-of-squares a b c)
  (define (sum-of-squares x y)
    (+ (* x x) (* y y)))
  (define (bigger x y) (if (> x y) x y))
  (if (= (bigger a b) a)
      (sum-of-squares a (bigger b c))
      (sum-of-squares b (bigger a c))))

(largest-sum-of-squares 4 2 5)
; 41