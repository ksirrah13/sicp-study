#lang sicp
(#%require "../lib/circuit-constraints.scm")

(define (squarer a b)
  (define (square x) (* x x))
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0 -- SQUARER" (get-value b))
            (set-value! a (sqrt (get-value b)) me)))
    (if (has-value? a)
        (set-value! b (square (get-value a)) me)))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))
          (else
           (error "Unknown request -- MULTIPLIER" request))))
  (connect a me)
  (connect b me)
  me)

(define a (make-connector))
(define b (make-connector))

(cprobe 'a a)
(cprobe 'b b)

(squarer a b)

(set-value! a 4 'user)
(forget-value! a 'user)

(set-value! b 36 'user)


;Probe: b = 16
;Probe: a = 4done
;
;Probe: b = ?
;Probe: a = ?done
;
;Probe: a = 6
;Probe: b = 36done
