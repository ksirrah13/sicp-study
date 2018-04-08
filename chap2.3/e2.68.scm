#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (walk-tree cur-tree)
    (cond ((null? cur-tree) (error "null tree searching for symbol" symbol))
          ((leaf? cur-tree) (test-leaf cur-tree))
          ((element-of-set? symbol (symbols (left-branch-huff cur-tree)))
           (cons 0 (walk-tree (left-branch-huff cur-tree))))
          ((element-of-set? symbol (symbols (right-branch-huff cur-tree)))
           (cons 1 (walk-tree (right-branch-huff cur-tree))))
          (else (error "No matching symbol in tree" symbol))))
  (define (test-leaf leaf)
    (if (equal? (symbol-leaf leaf) symbol)
        '()
        (error "No matching symbol in tree" symbol)))
  (walk-tree tree))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(A D A B B C A))

(encode sample-message sample-tree)
; {0 1 1 0 0 1 0 1 0 1 1 1 0}