#lang sicp
(#%require "../lib/ch2-shared.scm")

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
; 1 1/2

(fold-left / 1 (list 1 2 3))
; 1/6

(fold-right list nil (list 1 2 3))
; {1 {2 {3 ()}}}

(fold-left list nil (list 1 2 3))
; {{{() 1} 2} 3}

;; fold-right and fold-left will give the same result if the op is commutative
;; - and / and are not
;; + and * are

(fold-right * 1 (list 1 2 3))
; 6

(fold-left * 1 (list 1 2 3))
; 6