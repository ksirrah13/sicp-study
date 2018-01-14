#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (nth-root-fp n x)
  (lambda (y)
    (/ x
       (expt y (dec n)))))

; sqrt 9 fixed-point function
(nth-root-fp 2 9.0)

; cube root 27 fp function
(nth-root-fp 3 27.0)

(define (nth-root-test n x damp-count)
  (let ((fp (nth-root-fp n x))
        (avg-damp (repeated average-damp damp-count)))
    (fixed-point (avg-damp fp) 1)))

(nth-root-test 2 9.0 1)
; 3.0

(nth-root-test 3 27.0 1)
; 2.9999972321057697

;(nth-root-test 4 81.0 1)
; fail

(nth-root-test 4 81.0 2)
; 3.000000000000033

(nth-root-test 5 243.0 2)
; 3.0000008877496294

(nth-root-test 6 729.0 2)
; 2.999996785898161

(nth-root-test 7 2187.0 2)
; 3.0000041735235943

;(nth-root-test 8 6561.0 2)
; fail

(nth-root-test 8 6561.0 3)
; 3.0000000000173292

(nth-root-test 15 6561.0 3)
; 1.7966504946827608

;(nth-root-test 16 6561.0 3)
; fail

;; 2^(damp-count+1) - 1 = max-root
;; damp-count = (log(max-root + 1) / log 2) - 1

(define (damp-count n-root)
  (ceiling (- (/ (log (inc n-root))
                 (log 2))
              1)))

(damp-count 3)
; 1.0

(damp-count 4)
; 2.0

(damp-count 14)
; 3.0

(define (nth-root n x)
  (let ((fp (nth-root-fp n x))
        (avg-damp (repeated average-damp (damp-count n))))
    (fixed-point (avg-damp fp) 1)))

(nth-root 35 45353224253.0)
; 2.015925181277241
