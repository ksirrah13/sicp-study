#lang sicp
(#%require "../lib/global-shared.scm")

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-gen items)
  (map square items))

(square-list (list 1 2 3 4))
; {1 4 9 16}

(square-list-gen (list 1 2 3 4))
; {1 4 9 16}