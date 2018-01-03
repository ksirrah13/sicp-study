#lang sicp

;; recursive
(define (fa n)
  (cond ((< n 3) n)
        (else (+ (fa (- n 1))
                 (* 2 (fa (- n 2)))
                 (* 3 (fa (- n 3)))))))

(fa 5)
; 25

;; iterative
(define (fb n)
  (define (fb-iter n f1 f2 f3)
    (cond ((< n 2) n)
          ((= n 2) f1)
          (else (fb-iter (- n 1)
                         (+ f1 (* 2 f2) (* 3 f3))
                         f1
                         f2))))
  (fb-iter n 2 1 0))

(fb 5)
; 25
