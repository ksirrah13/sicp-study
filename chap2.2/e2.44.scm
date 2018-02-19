#lang sicp
(#%require sicp-pict)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (dec n))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (dec n))))
        (below painter (beside smaller smaller)))))

(paint einstein)

(paint (right-split einstein 2))

(paint (up-split einstein 2))