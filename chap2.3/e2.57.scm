#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (arith-extend sym exp)
  (let ((ext (cddr exp)))
    (if (null? (cdr ext))
        (car ext)
        (cons sym ext))))

(define (augend exp)
  (arith-extend '+ exp))

(define (multiplicand exp)
  (arith-extend '* exp))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp)
                                                          (- (exponent exp) 1)))
                       (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(deriv '(* x y (+ x 3)) 'x)
; {+ {* x y} {* y {+ x 3}}}
  