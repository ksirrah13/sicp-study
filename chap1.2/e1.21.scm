#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divide? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(smallest-divisor 199)
; 199

(smallest-divisor 1999)
; 1999

(smallest-divisor 19999)
; 7
