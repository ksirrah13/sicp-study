#lang sicp

;; fast iterative exponent
(define (fast-expt b n)
  (define (fast-expt-iter b n result)
    (cond ((< n 1) result)
          ((even? n) (fast-expt-iter (* b b) (/ n 2) result))
          (else (fast-expt-iter b (- n 1) (* result b)))))
  (fast-expt-iter b n 1))

(fast-expt 3 4)
; 81
