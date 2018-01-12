#lang sicp
(#%require "../shared.scm")

(define (cubic a b c)
  (lambda (x)
    (+ (expt x 3)
       (* a (square x))
       (* b x)
       c)))

;; (x-1)(x+3)(x+6) = 0
;; x^3 + 8x^2 + 9x - 18 = 0
(newton (cubic 8 9 -18) 1)
; x = 1

((cubic 8 9 -18) 1)
; 0

;; x^3 + x^2 + 2x + 3 = 0
(newton (cubic 1 2 3) 1)
; x = -1.2756822036498454

((cubic 1 2 3) -1.2756822036498454)
; 4.935607478273596e-12





