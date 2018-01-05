#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 .01)
; 0.24998750000000042

(integral cube 0 1 .001)
; 0.249999875000001

;; Simpson's rule
(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (y-of-k k)
    (f (+ a (* k h))))
  (define (y-term k)
    (let ((term (y-of-k k)))
      (cond ((or (= k 0) (= k n)) term)
            ((odd? k) (* 4 term))
            (else (* 2 term)))))
  (* (/ h 3.0) (sum y-term 0 inc n)))

(simpson-integral cube 0 1 100)
; 0.25

(simpson-integral cube 0 1 1000)
; 0.25

(simpson-integral cube 0 1 1)
; 0.3333333333333333

(simpson-integral cube 0 1 2)
; 0.25