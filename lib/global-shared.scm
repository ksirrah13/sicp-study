#lang sicp
(#%provide (all-defined))

;; Numbers
(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

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

(define (divide? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (and (> n 1)
       (= n (smallest-divisor n))))