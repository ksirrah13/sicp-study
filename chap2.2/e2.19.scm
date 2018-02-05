#lang sicp

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define first-denomination car)

(define except-first-denomination cdr)

(define no-more? null?)

(cc 100 us-coins)
; 292

(cc 100 uk-coins)
; 104561

;; order shouldn't matter since its just checking ways to make change ignoring a denom

(define us-coins-unordered (list 1 25 10 50 5))
(define uk-coins-unordered (list  50 0.5 10 100 5 2 20 1))

(cc 100 us-coins-unordered)
; 292

(cc 100 uk-coins-unordered)
; 104561

;; same results