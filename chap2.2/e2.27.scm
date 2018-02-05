#lang sicp

(define (deep-reverse l)
  (define (iter input result)
    (cond ((null? input) result)
          ((pair? (car input)) (iter (cdr input)
                                     (cons (deep-reverse (car input))
                                           result)))
          (else (iter (cdr input) (cons (car input) result)))))
  (iter l nil))
    

(deep-reverse (list 1 4 9 16 25))
; {25 16 9 4 1}

(define x (list (list 1 2) (list 3 4)))
x
; {{1 2} {3 4}}

(reverse x)
; {{3 4} {1 2}}

(deep-reverse x)
; {{4 3} {2 1}}