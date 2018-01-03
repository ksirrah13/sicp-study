#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 4 -5)
; 9

; if b is positive then operation applied to a and b is '+'
; if b is negative then operation applied is '-'