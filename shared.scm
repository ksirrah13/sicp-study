#lang sicp
(#%provide (all-defined))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

(define (half x)
  (/ x 2))

(define (double x)
  (+ x x))

(define (divide? a b)
  (= (remainder b a) 0))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (smallest-divisor n)
  (define (next-test n)
    (if (= n 2) 3 (+ n 2)))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divide? test-divisor n) test-divisor)
          (else (find-divisor n (next-test test-divisor)))))
  (find-divisor n 2))

(define (prime? n)
  (and (> n 1)
       (= n (smallest-divisor n))))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter cur result)
    (cond ((> cur b) result)
          ((filter cur) (iter (next cur)
                              (combiner result (term cur))))
          (else (iter (next cur) result))))
  (iter a null-value))

(define (accumulate combiner null-value term a next b)
  (define (true x) #t)
  (filtered-accumulate true combiner null-value term a next b))