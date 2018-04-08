#lang sicp
(#%require "../lib/ch2-shared.scm")

;; we can just convert trees to lists and use the union and intersection operations we already have
;; then convert the list back into a tree
;; to convert both n sized trees to list it takes 2n
;; to do union or intersection of 2 n sized lists it takes 2n
;; to convert at most 2n elements to tree it takes 2n
;; so overal time is 6n or just O(n)

(define (tree-union tree1 tree2)
  (list->tree (union-set (tree->list tree1)
                         (tree->list tree2))))

(define (tree-intersection tree1 tree2)
  (list->tree (intersection-set (tree->list tree1)
                                (tree->list tree2))))

(define t1 (list->tree '(1 3 5 7 9)))

(define t2 (list->tree '(2 4 5 6 7)))

t1
; {5 {1 () {3 () ()}} {7 () {9 () ()}}}

;     5
;   1   7
;    3   9

t2
; {5 {2 () {4 () ()}} {6 () {7 () ()}}}

;     5
;   2   6
;    4   7

(tree-union t1 t2)
; {4 {2 {1 () ()} {3 () ()}} {6 {5 () ()} {7 () {9 () ()}}}}

;         4
;      2     6
;    1  3   5  7
;               9

(tree-intersection t1 t2)
; {5 () {7 () ()}}

;     5
;      7

