#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c- x y)
  (let ((z (make-connector)))
    (adder z y x )
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (multiplier z y x)
    z))

(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
    z))

(define (celsius-fahrenheit-converter x)
  (c+ (c* (c/ (cv 9) (cv 5))
          x)
      (cv 32)))
(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(cprobe 'C C)
(cprobe 'F F)

(set-value! C 25.0 'user)
(forget-value! C 'user)

(set-value! F 80.0 'user)

;Probe: C = 25.0
;Probe: F = 77.0done
;
;Probe: C = ?
;Probe: F = ?done
;
;Probe: F = 80.0
;Probe: C = 26.666666666666664done
