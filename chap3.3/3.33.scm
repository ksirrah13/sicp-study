#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (averager a b c)
  (let ((two (make-connector))
        (equal (make-connector)))
    (constant 2 two)
    (adder a b equal)
    (multiplier c two equal)
    'ok))

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(cprobe 'a a)
(cprobe 'b b)
(cprobe 'c c)

(averager a b c)

(set-value! b 3 'user)
(set-value! a 5 'user)

(forget-value! b 'user)
(set-value! c 13 'user)

;Probe: b = 3done
;
;Probe: c = 4
;Probe: a = 5done
;
;Probe: c = ?
;Probe: b = ?done
;
;Probe: b = 21
;Probe: c = 13done