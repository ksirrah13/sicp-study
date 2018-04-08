#lang sicp
(#%require "../lib/ch2-shared.scm")

;; exponentiation?, base, exponent, and make-exponentiation

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))

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


(deriv '(* 3 (** y 3)) 'y)
; {* 3 {* 3 {** y 2}}}

(deriv '(+ (** x 2) (* 2 (** (+ y 1) 2))) 'x)
; {* 2 x}

(deriv '(+ (** x 2) (* 2 (** (+ y 1) 2))) 'y)
; {* 2 {* 2 {+ y 1}}}