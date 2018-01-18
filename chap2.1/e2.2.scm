#lang sicp
(#%require "../lib/global-shared.scm")

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; point a (3,6)
(define a (make-point 3 6))

; point b (-5,10)
(define b (make-point -5 10))

(define s (make-segment a b))

(define mid-p (midpoint-segment s))

(print-point mid-p)
; (-1,8)

