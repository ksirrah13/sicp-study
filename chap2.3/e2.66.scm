#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (lookup-tree numeric-key tree-of-records)
  (if (null? tree-of-records)
      false
      (let ((entry-key (key (entry tree-of-records))))
        (cond ((= numeric-key entry-key) (entry tree-of-records))
              ((< numeric-key entry-key)
               (lookup-tree numeric-key (left-branch tree-of-records)))
              ((> numeric-key entry-key)
               (lookup-tree numeric-key (right-branch tree-of-records)))))))
