#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (make-leaf val)
  (make-tree val nil nil))

;; test trees
(define t1 (make-tree 7
                     (make-tree 3
                                (make-leaf 1)
                                (make-leaf 5))
                     (make-tree 9
                                nil
                                (make-leaf 11))))

(define t2 (make-tree 3
                     (make-leaf 1)
                     (make-tree 7
                                (make-leaf 5)
                                (make-tree 9
                                           nil
                                           (make-leaf 11)))))

(define t3 (make-tree 5
                      (make-tree 3
                                 (make-leaf 1)
                                 nil)
                      (make-tree 9
                                 (make-leaf 7)
                                 (make-leaf 11))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(tree->list-1 t2)
; {1 3 5 7 9 11}

(tree->list-2 t3)
; {1 3 5 7 9 11}

;; a. both procedures produce the same list

;; b. one procedure is an iterative process (2) and one is recursive (1)
;; the interative process should grow more slowly

