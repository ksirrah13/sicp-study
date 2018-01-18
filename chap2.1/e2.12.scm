#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* (/ p 100) c)))

(define (percent i)
  ( * (/ (width i)
         (center i))
      100))

(define i (make-interval 0.45 0.55))
(center i)
; 0.5

(width i)
; 0.05000000000000002

(percent i)
; 10.000000000000004

(define i2 (make-center-percent 2.2 15))
(center i2)
; 2.2

(width i2)
; 0.33000000000000007

(percent i2)
; 15.000000000000002