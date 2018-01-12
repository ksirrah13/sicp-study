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

(define (expt b n)
  (define (fast-expt-iter b n result)
    (cond ((< n 1) result)
          ((even? n) (fast-expt-iter (* b b) (/ n 2) result))
          (else (fast-expt-iter b (- n 1) (* result b)))))
  (fast-expt-iter b n 1))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (sqrt x)
  (fixed-point
   (average-damp (lambda (y)
                   (/ x y)))
   1))

(define (nth-root n x)
  (define (nth-root-fp n x)
    (lambda (y)
      (/ x
         (expt y (dec n)))))
  (define (damp-count n-root)
    (ceiling (- (/ (log (inc n-root))
                   (log 2))
                1)))
  (let ((fp (nth-root-fp n x))
        (avg-damp (repeated average-damp (damp-count n))))
    (fixed-point (avg-damp fp) 1)))

(define (fixed-point f guess)
  (define (iter old new)
    (if (close-enough? old new)
        new
        (iter new (f new))))
  (define (close-enough? a b)
    (< (abs (- a b)) 0.00001))
  (iter guess (f guess)))

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

(define (cont-frac-gen n d combinator k)
  (define (cont-frac-iter i result)
    (cond ((< i 1) result)
          (else (cont-frac-iter (dec i)
                                (/ (n i)
                                   (combinator (d i) result))))))
  (cont-frac-iter k 0))

(define (cont-frac n d k)
  (cont-frac-gen n d + k))

(define (newton f guess)
  (define df (deriv f))
  (fixed-point(lambda (x)
                (- x (/ (f x) (df x))))
              guess))

(define (deriv f)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (f (+ x dx))
          (f x))
       dx)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter g i)
    (if (< i 2)
        g
        (iter (compose f g) (dec i))))
  (iter f n))