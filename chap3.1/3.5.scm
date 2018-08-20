#lang sicp

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (P (random-in-range x1 x2) (random-in-range y1 y2)))
  (* (monte-carlo trials experiment)
     (* (- x2 x1) (- y2 y1))))

(define (random-in-range low high)
  (+ low (random (- high low))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (unit-circle-test x y)
  (<= (+ (expt x 2) (expt y 2)) 1))

(estimate-integral unit-circle-test -1.0 1.0 -1.0 1.0 100000)
; 3.1418

