#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (new-if pred then-result else-result)
  (cond (pred then-result)
        (else else-result)))

(new-if (= 2 3) 0 5)
; 5

(define (sqrt x)
  (define (sqrt-iter guess)
    (new-if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1))

(sqrt 9)
;; infinite loop on sqrt-iter with new-if
;; all arguments are evaluated so sqrt-iter is called every time
