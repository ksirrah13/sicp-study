#lang sicp

;; recursive accumulator
(define (r-product term a next b)
  (if (> a b)
      1
      (* (term a)
         (r-product term (next a) next b))))

(define (r-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (r-sum term (next a) next b))))

(define (r-accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (r-accumulate combiner null-value term (next a) next b))))

(r-product identity 1 inc 5)
; 120

(define (new-product term a next b)
  (r-accumulate * 1 term a next b))

(new-product identity 1 inc 5)
; 120

;; iterative accumulator
(define (i-sum term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (+ (term cur) result))))
    (iter a 0))

(define (i-product term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (* result (term cur)))))
  (iter a 1))

(define (i-accumulate combiner null-value term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (combiner result (term cur)))))
  (iter a null-value))

(i-sum identity 1 inc 5)
; 15

(define (new-sum term a next b)
  (i-accumulate + 0 term a next b))

(new-sum identity 1 inc 5)
; 15