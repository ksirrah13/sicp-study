#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (r-iterative-improve good-enough improve)
  (lambda (guess)
    (if (good-enough guess)
        guess
        ((r-iterative-improve good-enough improve) (improve guess)))))

(define (iterative-improve good-enough improve)
  (lambda (first-guess)
    (define (iter guess)
      (if (good-enough guess)
          guess
          (iter (improve guess))))
    (iter first-guess)))

(define (sqrt x)
  (define (good-enough guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((r-iterative-improve good-enough improve) 1))

(sqrt 25.0)
; 5.000000000053722

(define (fixed-point f guess)
  (define (good-enough guess)
    (< (abs (- guess (f guess))) 0.0001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough improve) guess))

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)
; 1.2587758014705526
