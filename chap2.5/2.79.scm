#lang sicp
(#%require "../lib/op-table.scm")
(#%require "../lib/arithmetic.scm")

(define (equ? num1 num2)
  (apply-generic 'equal num1 num2))

(put 'equal '(scheme-number scheme-number) =)

(equ? 3 4)
; #f

(equ? 3 3.0)
; #t

(define numer car)
(define denom cdr)

(define (equal-rat r1 r2)
  (and (equ? (numer r1) (numer r2))
       (equ? (denom r1) (denom r2))))

(put 'equal '(rational rational) equal-rat)

(equ? (make-rational 4 6) (make-rational 2 3))
; #t

(equ? (make-rational 4 7) (make-rational 2 3))
; #f

(define real-part-r car)
(define imag-part-r cdr)
(define mag car)
(define ang cdr)

(define (equal-complex-rect c1 c2)
  (and (equ? (real-part-r c1) (real-part-r c2))
       (equ? (imag-part-r c1) (imag-part-r c2))))

(define (equal-complex-polar c1 c2)
  (and (equ? (mag c1) (mag c2))
       (equ? (ang c1) (ang c2))))

(put 'equal '(complex complex) equ?)
(put 'equal '(rectangular rectangular) equal-complex-rect)
(put 'equal '(polar polar) equal-complex-polar)

(define c1 (make-complex-from-real-imag 3 4))
(define c2 (make-complex-from-mag-ang (magnitude c1) (angle c1)))

(equ? (make-complex-from-real-imag 3 4) (make-complex-from-real-imag 3 4))
; #t

(equ? (make-complex-from-real-imag 2 1) (make-complex-from-real-imag 3 4))
; #f

(equ? (make-complex-from-mag-ang 3 25) (make-complex-from-mag-ang 3 25))
; #t

(equ? (make-complex-from-mag-ang 5 60) (make-complex-from-mag-ang 3 25))
; #f