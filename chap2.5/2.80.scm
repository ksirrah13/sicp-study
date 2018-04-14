#lang sicp
(#%require "../lib/op-table.scm")
(#%require "../lib/arithmetic.scm")

(define (=zero? num)
  (apply-generic 'zero num))

(put 'zero '(scheme-number) (lambda (num) (= num 0)))

(=zero? 0.0)
; #t

(=zero? 0.0001)
; #f

(define numer car)

(put 'zero '(rational) (lambda (r) (=zero? (numer r))))

(=zero? (make-rational 0 6))
; #t

(=zero? (make-rational 4 1))
; #f

(define real-part-r car)
(define imag-part-r cdr)
(define mag car)
(define ang cdr)

(define (zero-complex-rect c)
  (and (=zero? (real-part-r c))
       (=zero? (imag-part-r c))))

(define (zero-complex-polar c)
  (=zero? (mag c)))

(put 'zero '(complex) =zero?)
(put 'zero '(rectangular) zero-complex-rect)
(put 'zero '(polar) zero-complex-polar)

(define c1 (make-complex-from-mag-ang (make-rational 0 6) 90))

(=zero? (make-complex-from-real-imag 0 0))
; #t

(=zero? (make-complex-from-real-imag 2 1))
; #f

(=zero? c1)
; #t

(=zero? (make-complex-from-mag-ang 5 0))
; #f
