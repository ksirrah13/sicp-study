#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 3 2))
(cdr (lambda (m) (m 3 2)))
((lambda (m) (m 3 2)) (lambda (p q) q))
((lambda (p q) q) 3 2)
2

(car (cons 3 2))
(car (lambda (m) (m 3 2)))
((lambda (m) (m 3 2)) (lambda (p q) p))
((lambda (p q) p) 3 2)
3