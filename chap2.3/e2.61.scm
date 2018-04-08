#lang sicp

;; ordered representation
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set) #t))
        ((< x (car set) #f))
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(adjoin-set 4 '(1 3 5 7))
; {1 3 4 5 7}

(adjoin-set 5 '(1 3 5 7))
; {1 3 5 7}