#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (ripple-carry-adder a b sum cout)
  (let ((carry (make-wire)))
    (cond ((null? a) 'done)
          ((null? (cdr a)) (full-adder (car a) (car b) (make-wire) (car sum) cout))
          (else (full-adder (car a) (car b) carry (car sum) cout)
                (ripple-carry-adder (cdr a) (cdr b) (cdr sum) carry)))))

;a1 b1 new1 s1 cout
;a2 b2 new2 s2 new1
;a3 b3 0    s3 new2
;'done 

(define (make-wire-set size)
  (define (iter size wires)
    (if (< size 1)
        wires
        (iter (dec size) (cons (make-wire) wires))))
  (iter size nil))

(define a (make-wire-set 3))
(define b (make-wire-set 3))
(define sum (make-wire-set 3))
(define cout (make-wire))

(ripple-carry-adder a b sum cout)

(probe 'sum1 (car sum))
(probe 'sum2 (cadr sum))
(probe 'sum3 (caddr sum))
(probe 'cout cout)

(set-signal! (cadr a) 1)
(propagate)
; 010

(set-signal! (caddr b) 1)
(propagate)
; 011

(set-signal! (caddr a) 1)
(propagate)
; 100

(set-signal! (car b) 1)
(propagate)
; 000, cout = 1