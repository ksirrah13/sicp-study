#lang sicp

(define (make-accumulator acc)
  (lambda (input)
    (set! acc (+ acc input))
    acc))

(define A (make-accumulator 5))

(A 10)
; 15

(A 10)
; 25

(define B (make-accumulator 3))

(B 3)
; 6

(B 1)
; 7