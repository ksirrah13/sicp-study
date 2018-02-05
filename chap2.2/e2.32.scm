#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (r)
                            (cons (car s) r))
                          rest)))))

(subsets (list 1 2 3))
; {() {3} {2} {2 3} {1} {1 3} {1 2} {1 2 3}}