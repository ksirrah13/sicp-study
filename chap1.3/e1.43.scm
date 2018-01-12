#lang sicp
(#%require "../shared.scm")

(define (repeated f n)
  (define (iter g i)
    (if (< i 2)
        g
        (iter (compose f g) (dec i))))
  (iter f n))

((repeated square 2) 5)
; 625