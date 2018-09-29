#lang sicp
(#%require "../lib/streams.scm")

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

;; its basically doing long division to compute the decimal of division
;; computes the whole number of division between to integers
;; to get the next number it multiplies whats left by the base and does it again

;; its num / den represented in the base of radix

(define t1 (expand 1 7 10))
(display-stream t1)
;1
;4
;2
;8
;5
;7
;1
;4
;2
;8

; 1/7 = 0.1728571428...

(define t2 (expand 3 8 10))
(display-stream t2)
;3
;7
;5
;0
;0
;0
;0

; 3/8 = 0.375000...

