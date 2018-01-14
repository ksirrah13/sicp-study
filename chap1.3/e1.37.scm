#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (cond ((< i 1) result)
          (else (cont-frac-iter (dec i)
                                (/ (n i)
                                   (+ (d i) result))))))
  (cont-frac-iter k 0))

(define (golden-cf k)
  (/ 1 (cont-frac (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k)))

(golden-cf 15)
; 1.6180327868852458

;; recursive continued fraction
(define (r-cont-frac n d k)
  (define (recursor i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recursor (inc i))))))
  (recursor 1))

(define (golden-rcf k)
  (/ 1 (r-cont-frac (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    k)))

(golden-rcf 15)
; 1.6180327868852458
