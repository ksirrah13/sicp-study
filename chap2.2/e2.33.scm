#lang sicp
(#%require "../lib/ch2-shared.scm")


(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))

(define a (list 1 2 3 4 5))

(map (lambda (x) (* x x)) a)
; {1 4 9 16 25}


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append a (list 6 7 8 9))
; {1 2 3 4 5 6 7 8 9}

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y) )
              0
              sequence))

(length a)
; 5