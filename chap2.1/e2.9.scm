#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (width i)
  (abs (/ (- (upper-bound i)
             (lower-bound i))
          2)))

(define i1 (make-interval 0.4 0.6))

(define i2 (make-interval 1.45 1.55))

(width i1)
; 0.09999999999999998

(width i2)
; 0.050000000000000044

;; Addition of Widths
(define sum-of-widths
  (+ (width i1)
     (width i2)))

(define width-of-sum
  (width (add-interval i1 i2)))

(display sum-of-widths)
; 0.15000000000000002

(display width-of-sum)
; 0.1499999999999999


;; Subtraction of Widths
(define sub-of-widths
  (- (width i1)
     (width i2)))

(define width-of-sub
  (width (sub-interval i2 i1)))

(display sub-of-widths)
; 0.04999999999999993

(display width-of-sub)
; 0.04999999999999988

;; Multiplication of Widths
(define mult-of-widths
  (* (width i1)
     (width i2)))

(define width-of-mult
  (width (mul-interval i1 i2)))

(display mult-of-widths)
; 0.005000000000000004

(display width-of-mult)
; 0.175
