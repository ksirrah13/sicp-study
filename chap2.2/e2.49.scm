#lang sicp
(#%require sicp-pict)

;; loses top and right edges at 1 so using 0.99
(define one 0.99)
(define bl (make-vect 0 0))
(define br (make-vect one 0))
(define tl (make-vect 0 one))
(define tr (make-vect one one))

;; Box around the frame
(define frame-seg (list (make-segment bl br)
                        (make-segment br tr)
                        (make-segment tr tl)
                        (make-segment tl bl)))

(define frame-painter (segments->painter frame-seg))

(paint frame-painter)

;; X across the frame
(define x-seg (list (make-segment tl br)
                    (make-segment tr bl)))

(define x-painter (segments->painter x-seg))

(paint x-painter)

;; Diamond in the frame
(define ml (make-vect 0 0.5))
(define mt (make-vect 0.5 one))
(define mr (make-vect one 0.5))
(define mb (make-vect 0.5 0))

(define diamond-seg (list (make-segment mb ml)
                          (make-segment ml mt)
                          (make-segment mt mr)
                          (make-segment mr mb)))

(define diamond-painter (segments->painter diamond-seg))

(paint diamond-painter)
