#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

(define l '(2 4 5 6 8 13 17 19 20))

(list->tree l)
;; a.
;  {8 {4 {2 () ()} {5 () {6 () ()}}} {17 {13 () ()} {19 () {20 () ()}}}}
;
;     8
;   /   \
;  4     17
; / \    / \
;2   5  13  19
;     \      \
;      6      20
;
;; paritial tree returns a pair where the first value is a tree and the second value is remaining elements
;; the algorithm works by first dividing the list in half minus one for the entry node
;; then it recursively calls partial tree to create a left side tree from this first half of element
;; it then takes the first value of the remaining elements from the left tree result to be the entry node
;; and it again it recursively calls partial tree to create a right side tree from the remaining elements
;; finally it makes a new tree by adding the entry node and left and right trees


;; b. If it took n to build this tree then to build one with twice as many elements
;; we would have to build one half of the new tree in n steps and the second half in another n steps
;; then just pair them together as branches of the new tree taking 2n steps.
;; So order of growth looks to be n, because even though we divide the list to be done in half each time
;; we're also calling the procedure twice each time.