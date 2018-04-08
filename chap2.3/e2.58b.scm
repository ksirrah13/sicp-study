#lang sicp

(define (pre-memq sym x)
  (cond ((null? x) nil)
        ((and (pair? x) (eq? (car x) sym)) nil)
        (else (cons (car x) (pre-memq sym (cdr x))))))

(pre-memq '* '(x + 1 * 3 * 4))
; {x + 1}

(memq '* '(x + 1 * 3 * 4))
; {* 3 * 4}
        
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (flatten x)
  (if (and (pair? x)
           (null? (cdr x)))
      (car x)
      x))

(define (sum? x)
  (and (pair? x)
       (memq '+ x)))

(define (addend s)
  (flatten (pre-memq '+ s)))

(define (augend s)
  (flatten (cdr (memq '+ s))))

(define (product? x)
  (and (pair? x)
       (not (sum? x))
       (memq '* x)))

(define (multiplier p)
  (flatten (pre-memq '* p)))

(define (multiplicand p)
  (flatten (cdr (memq '* p))))

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
        (else
         (error "unknown expression type -- DERIV" exp))))

;; 4x + 3y + 6
(deriv '(x + 3 * (x + y + 2)) 'x)
; 4

;; 4x + 3y + 6
(deriv '(x + 3 * (x + y + 2)) 'y)
; 3

;; x^2 + 7x + 6
(deriv '((x + 3) * (x + 2) + x * 2) 'x)
; {{{x + 3} + {x + 2}} + 2}
; 2x + 7