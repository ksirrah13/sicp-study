#lang sicp
(#%require sicp-pict)
(#%require "../lib/ch2-shared.scm")

;; going to modify diamond instead of wave for excercises
(define one 0.99)
(define ml (make-vect 0 0.5))
(define mt (make-vect 0.5 one))
(define mr (make-vect one 0.5))
(define mb (make-vect 0.5 0))
(define mid (make-vect 0.5 0.5))

(define diamond-seg (list (make-segment mb ml)
                          (make-segment ml mt)
                          (make-segment mt mr)
                          (make-segment mr mb)
                          (make-segment mid ml)
                          (make-segment mid mt)))

(define diamond (segments->painter diamond-seg))

(paint diamond)


(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up right))
              (bottom-right (below right up))
              (corner (corner-split (rotate90 painter) (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split diamond 3))


(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside quarter (flip-horiz quarter))))
      (below half (flip-vert half)))))

(paint (square-limit diamond 3))
