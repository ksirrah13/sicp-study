#lang sicp
(#%require "../lib/ch1-shared.scm")

;; square root by fixed point
(define (sqrt x)
  (fixed-point
   (average-damp (lambda (y)
                   (/ x y)))
   1))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (fixed-point f guess)
  (define (iter old new)
    (if (close-enough? old new)
        new
        (iter new (f new))))
  (define (close-enough? a b)
    (< (abs (- a b)) 0.00001))
  (iter guess (f guess)))

;; square root by newtons roots
(define (newton-sqrt x)
  (newton (lambda (y)
            (- x (square y)))
          1))

(define (newton f guess)
  (define df (deriv f))
  (fixed-point(lambda (x)
                (- x (/ (f x) (df x))))
              guess))

(define (deriv f)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (f (+ x dx))
          (f x))
       dx)))


