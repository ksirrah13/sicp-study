#lang sicp

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car p)
  (factors-of 2 p))

(define (cdr p)
  (factors-of 3 p))

(define (factors-of n i)
  (define (iter value count)
    (if (and (= 0 (remainder value n))
             (> value 0))
        (iter (/ value n) (inc count))
        count))
  (iter i 0))

(factors-of 3 54)
; 3

(factors-of 2 108)
; 2

(define pair (cons 3 6))
; 5832

(car pair)
; 3

(cdr pair)
; 6
