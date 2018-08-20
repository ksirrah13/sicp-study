#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (define (logical-or a b)
    (if (or (= a 1) (= b 1))
        1
        0))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define a (make-wire))
(define b (make-wire))
(define out (make-wire))

(probe 'out out)
(or-gate a b out)

(set-signal! a 1)
(propagate)

(set-signal! a 0)
(propagate)
