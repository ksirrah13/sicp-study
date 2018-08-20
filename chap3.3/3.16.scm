#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define three (cons 'a (cons 'b (cons 'c nil))))
(count-pairs three)
; 3

(define a-pair (cons 'a nil))
(count-pairs a-pair)
; 1

(define four (cons a-pair (cons a-pair nil)))
(count-pairs four)
; 4

(define b-pair (cons a-pair a-pair))
(count-pairs b-pair)
; 3

(define seven (cons b-pair b-pair))
(count-pairs seven)
; 7

(define inf (cons 'a (cons 'b (cons 'c nil))))
(set-cdr! (cddr inf) inf)
; (count-pairs inf)
; run forever


