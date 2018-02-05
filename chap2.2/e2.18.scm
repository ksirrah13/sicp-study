#lang sicp

(define (reverse l)
  (define (iter l result)
    (cond ((null? l) result)
          (else (iter (cdr l) (cons (car l)
                                    result)))))
  (iter l nil))

(reverse (list 1 4 9 16 25))
; {25 16 9 4 1}