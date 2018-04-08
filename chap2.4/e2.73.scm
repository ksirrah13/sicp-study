#lang sicp
(#%require "../lib/ch2-shared.scm")
(#%require "../lib/op-table.scm")

;; 2.73a. rather than including all the different type of expressions in conditions for derivitives
;; we are moving the types into a table to be called by dispatch.
;; The type tag will be the operator for the expression, ie +, -, *.
;; The first two operations will not have an operator, or type tag,
;; so we can't dispatch by type of them.

;; 2.73b
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-sum-deriv)
  (define (do-deriv operands var)
    (let ((addend (car operands))
          (augend (cadr operands)))
      (make-sum (deriv addend var)
                (deriv augend var))))
  (put 'deriv '+ do-deriv)
  'done)

(define (install-product-deriv)
  (define (do-deriv operands var)
    (let ((multiplier (car operands))
          (multiplicand (cadr operands)))
      (make-sum (make-product multiplier
                              (deriv multiplicand var))
                (make-product (deriv multiplier var)
                              multiplicand))))
  (put 'deriv '* do-deriv)
  'done)

(install-sum-deriv)
(install-product-deriv)

(deriv '(+ x (* x y)) 'x)
; {+ 1 y}

;; 2.73c
(define (install-exponent-deriv)
  (define (do-deriv operands var)
    (let ((base (car operands))
          (exponent (cadr operands)))
      (make-product (make-product exponent
                                  (make-exponentiation base
                                                       (- exponent 1)))
                    (deriv base var))))
  (put 'deriv '** do-deriv)
  'done)

;(deriv '(* 3 (** x 2)) 'x)
; error

(install-exponent-deriv)

(deriv '(* 3 (** x 2)) 'x)
; {* 3 {* 2 x}}

;; 2.73.d
;; switching the indexing order from op, type -> type, op
; ((get 'deriv (operator exp)) (operands exp) var)
; ((get (operator exp) 'deriv) (operands exp) var)

;; the only changes necessary are to the put operations in the packages
;; change from (put 'deriv op proc) to (put op 'deriv proc)
    