#lang sicp
(#%require sicp-pict)

;; Library implementation differs from the book
;; the transform in the book takes a painter and returns a painter (which takes a frame as argument)
;; the library takes specifications for a new frame and returns a procedure that takes a painter
(define flip-horiz
  (transform-painter (make-vect 1.0 0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(paint einstein)

(paint (flip-horiz einstein))


(define rotate180-counter
  (transform-painter (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(paint (rotate180-counter einstein))


(define rotate270-counter
  (transform-painter (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(paint (rotate270-counter einstein))
