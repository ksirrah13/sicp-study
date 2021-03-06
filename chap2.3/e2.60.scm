#lang sicp

;; allowing duplicates the procedure for element-of-set can stay the same

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; adjoin and union can be done without needed to use element-of-set

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (adjoin-set (car set1)
                          (union-set (cdr set1) set2)))))

(union-set '(1 3 5 7) '(3 5 7 9))
; {1 3 5 7 3 5 7 9}

;; intersection can also stay the same with duplicates

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; preformance of union-set and adjoin-set increase without having to do the element-of-set check
;; however, element-of-set check now has more elements to check through
;; intersection doesn't gain any benefit allowing duplicates

;; it may be preferable to allow duplicates if your primary use was union of sets


