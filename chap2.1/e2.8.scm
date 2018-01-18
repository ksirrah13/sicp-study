#lang sicp
(#%require "../lib/ch2-shared.scm")

;; subtract lower of y from x and upper of y from x
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define i1 (make-interval 0.4 0.6))

(define i2 (make-interval 1.45 1.55))

(display (sub-interval i2 i1))
; (0.9500000000000001 . 1.0499999999999998)