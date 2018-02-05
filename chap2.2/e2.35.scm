#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree)
                         (if (not (pair? sub-tree))
                              1
                              (count-leaves sub-tree)))
                       t)))

(define tree (list 1 2 (list 3 4 (list 5 6) 7) (list 8 9)))

(count-leaves tree)
; 9