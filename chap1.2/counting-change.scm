#lang sicp

;; counting change
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denom kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denom kinds)
  (cond ((= kinds 1) 1)
        ((= kinds 2) 5)
        ((= kinds 3) 10)
        ((= kinds 4) 25)
        ((= kinds 5) 50)))

(define (count-change amount)
  (cc amount 5))

(count-change 100)
; 292