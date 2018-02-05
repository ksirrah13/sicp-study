#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (same-parity test . l)
  (define (iter input result)
    (cond ((null? input) result)
          ((= (remainder test 2)
              (remainder (car input) 2))
           (iter (cdr input) (cons (car input)
                                   result)))
          (else (iter (cdr input) result))))
  (cond ((null? l) nil)
        (else (cons test (reverse (iter l nil))))))

(same-parity 1 2 3 4 5 6 7)
; {1 3 5 7}

(same-parity 2 3 4 5 6 7)
; {2 4 6}