#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (cubrt x)
  (define (cubrt-iter guess)
    (if (good-enough? guess)
        guess
        (cubrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- 1
               (/ (improve guess) guess))) .001))
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  (cubrt-iter 1))

(cubrt 27.0)
; 3.001274406506175
