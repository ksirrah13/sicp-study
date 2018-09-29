#lang sicp
(#%require "../lib/streams.scm")

(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)

;; racket / sicp lang is being stupid and doesn't recognize that y is defined
;; so this won't run
(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  )
y)

(solve (lambda (a) a) 1 0.001)


(define (solve-2nd a b dt y0 dy0) 
  (define y (integral (delay dy) y0 dt)) 
  (define dy (integral (delay ddy) dy0 dt)) 
  (define ddy (add-streams (scale-stream dy a) (scale-stream y b))) 
  y)

(solve-2nd 1 2 0.001 2 1)