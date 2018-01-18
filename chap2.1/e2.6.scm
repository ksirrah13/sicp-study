#lang sicp

;; function that takes a function
;; and returns an identity function
(define zero (lambda (f) (lambda (x) x)))

;; function that takes a function
;; and returns a function which applies that function
;; to the result of the parameter applied to that function
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)
(add-1 (lambda (f) (lambda (x) x)))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(lambda (f) (lambda (x) (f x)))

;; function that takes a function
;; and returns a function that applies that function once
(define one (lambda (f) (lambda (x) (f x))))

(add-1 one)
(add-1 (lambda (f) (lambda (x) (f x))))
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))

;; function that takes a function
;; and returns a function that applies that function twice
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(add one two)
(add (lambda (f) (lambda (x) (f x))) (lambda (f) (lambda (x) (f (f x)))))
(lambda (f) (lambda (x) (((lambda (f) (lambda (x) (f x))) f) (((lambda (f) (lambda (x) (f (f x)))) f) x))))
(lambda (f) (lambda (x) ((lambda (x) (f x)) (((lambda (f) (lambda (x) (f (f x)))) f) x))))
(lambda (f) (lambda (x) ((lambda (x) (f x)) ((lambda (x) (f (f x))) x))))
(lambda (f) (lambda (x) ((lambda (x) (f x)) (f (f x)))))
(lambda (f) (lambda (x) (f (f (f x)))))

(define three (lambda (f) (lambda (x) (f (f (f x))))))