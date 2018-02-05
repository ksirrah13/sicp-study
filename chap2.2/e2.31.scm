#lang sicp

(define (tree-map op tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map op sub-tree)
             (op sub-tree)))
       tree))

(define (square-tree tree)
  (tree-map (lambda (x) (* x x)) tree))

(define my-tree (list 1
                      (list 2 (list 3 4) 5)
                      (list 6 7)))

(square-tree my-tree)
; {1 {4 {9 16} 25} {36 49}}