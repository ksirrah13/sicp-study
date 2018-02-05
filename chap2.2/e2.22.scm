#lang sicp
(#%require "../lib/global-shared.scm")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

(square-list (list 1 2 3 4))
; {16 9 4 1}

;; Iteration works on each item from beginning to end
;; however since we always add the new item to the beginning of the list
;; we get a result with the last item at the beginning, reversed

(define (square-list-fixed items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list-fixed (list 1 2 3 4))
; {{{{() . 1} . 4} . 9} . 16}

;; to create a list structure the car of each pair should refer to the item
;; and the cdr should refer to the remaining list structure
;; reversing this ordering results in the cdr pointing to the item
;; and the car having the remaining list, not list structure at all
