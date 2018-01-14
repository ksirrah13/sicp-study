#lang sicp
(#%require "../lib/ch1-shared.scm")

;; recursive
(define (r-filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (r-filtered-accumulate filter combiner null-value term (next a) next b)))
        (else (r-filtered-accumulate filter combiner null-value term (next a) next b))))

;; iterative
(define (i-filtered-accumulate filter combiner null-value term a next b)
  (define (iter cur result)
    (cond ((> cur b) result)
          ((filter cur) (iter (next cur)
                              (combiner result (term cur))))
          (else (iter (next cur) result))))
  (iter a null-value))

;; sum of squares of prime numbers
(define (sum-of-squares-of-primes a b)
  (i-filtered-accumulate prime? + 0 square a inc b))

(sum-of-squares-of-primes 1 10)
; 87

;; product of integers less than n relatively prime to n
(define (product-of-relative-primes n)
  (define (prime-to-n? x)
    (= 1 (gcd x n)))
  (i-filtered-accumulate prime-to-n? * 1 identity 1 inc (dec n)))

(product-of-relative-primes 10)
; 189

