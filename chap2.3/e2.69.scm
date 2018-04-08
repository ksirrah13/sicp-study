#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set))
      (car set)
      (let ((new-node (make-code-tree (car set) (cadr set)))
            (new-set (cddr set)))
        (successive-merge (adjoin-set-huff new-node new-set)))))

(define pairs '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))

(define huff-tree (generate-huffman-tree pairs))

(define sample-message '(A B A F E G H C D A))

(define encoded-message (encode sample-message huff-tree))
; {0 1 1 1 0 1 0 1 0 1 0 1 1 1 0 0 1 1 0 0 0 1 1 0 1 1 1 0 0 0}

(decode encoded-message huff-tree)
; {A B A F E G H C D A}