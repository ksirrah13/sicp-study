#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (or-gate a1 a2 output)
  (let ((not-a (make-wire))
        (not-b (make-wire))
        (out-c (make-wire)))
    (inverter a1 not-a)
    (inverter a2 not-b)
    (and-gate not-a not-b out-c)
    (inverter out-c output)
    'ok))

(define a (make-wire))
(define b (make-wire))
(define out (make-wire))

(probe 'out out)
(or-gate a b out)

(set-signal! a 1)
(propagate)

(set-signal! a 0)
(propagate)


