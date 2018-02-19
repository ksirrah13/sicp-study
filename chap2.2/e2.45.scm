#lang sicp
(#%require sicp-pict)

(define (split primary-comb second-comb)
  (lambda (painter n)
    (let ((s (split primary-comb second-comb)))
      (if (= n 0)
          painter
          (let ((smaller (s painter (dec n))))
            (primary-comb painter (second-comb smaller smaller)))))))

(define up-split (split below beside))

(define right-split (split beside below))

(paint einstein)

(paint (right-split einstein 2))

(paint (up-split einstein 2))