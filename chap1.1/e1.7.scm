#lang sicp
(#%require "../shared.scm")

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
   (< (abs (- 1
              (/ (improve guess) guess))) .001))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 1))

(sqrt 900000000.0)
; 30009.62271905149

(sqrt 0.0000000009)
; 3.002306148991605e-05