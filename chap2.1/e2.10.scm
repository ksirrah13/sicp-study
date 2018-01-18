#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (div-interval x y)
  (define (spans-zero? i)
    (< (* (lower-bound i) (upper-bound i)) 0))
  (if (spans-zero? y)
      (error "cannot divide by interval spanning zero")
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define i1 (make-interval 0.4 0.6))

(define i2 (make-interval 0.45 0.55))

(define i-zero (make-interval -0.1 0.1))

(div-interval i1 i2)
; (0.7272727272727273 . 1.3333333333333333)

(div-interval i1 i-zero)
; cannot divide by interval spanning zero
