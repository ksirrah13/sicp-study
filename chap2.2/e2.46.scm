#lang sicp

(define (make-vect x y)
  (list x y))

(define xcor-vect car)

(define ycor-vect cadr)

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vect (* (xcor-vect v) s)
             (* (ycor-vect v) s)))

(define v1 (make-vect 1 2))
(define v2 (make-vect 4 3))

v1
; {1 2}

v2
; {4 3}

(sub-vect v2 v1)
; {3 1}

(scale-vect v2 3)
; {12 9}
