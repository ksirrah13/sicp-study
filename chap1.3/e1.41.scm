#lang sicp

(define (double f)
  (lambda (x)
    (f (f x))))

((double inc) 1)
; 3

(((double (double double)) inc) 5)
; 21
