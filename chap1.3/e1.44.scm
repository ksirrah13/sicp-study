#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (smooth f)
  (let ((dx 0.0001))
    (lambda (x)
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3.0))))

(define (n-smooth f n)
  ((repeated smooth n) f))

(define (supa-smooth-sqrt x)
  (n-smooth (average-damp (lambda (y) (/ x y))) 3))

(fixed-point (supa-smooth-sqrt 16) 1)
; 4.000000002500051
