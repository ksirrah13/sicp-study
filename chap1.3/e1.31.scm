#lang sicp

;; recursive product
(define (r-product term a next b)
  (if (> a b)
      1
      (* (term a)
         (r-product term (next a) next b))))

;; iterative product
(define (i-product term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (* result (term cur)))))
  (iter a 1))

;; factorial
(define (factorial x)
  (r-product identity 1 inc x))

(factorial 5)
; 120

;; estimate pi/4
(define (pi-product n)
  (define (pi-term x)
    (* (/ (- x 1.0) x)
       (/ (+ x 1.0) x)))
  (define (next-term x)
    (+ x 2))
  (i-product pi-term 3 next-term n))

(* 4 (pi-product 100))
; 3.157339689217561

(* 4 (pi-product 1000))
; 3.143163842419193
