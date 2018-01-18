#lang sicp
(#%require "../lib/global-shared.scm")

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (if (< d 0)
      (make-rat (- n) (- d))
      (let ((g (abs (gcd n d))))
        (cons (/ n g) (/ d g)))))

(print-rat (make-rat -9 -4))
; 9/4

(print-rat (make-rat -6 4))
; -3/2

(print-rat (make-rat 12 -3))
; -4/1

(print-rat (make-rat 14 4))
; 7/2

        