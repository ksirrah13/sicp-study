#lang sicp
(#%require sicp-pict)

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom (transform-painter (make-vect 0.0 0.0)
                                           (make-vect 1.0 0.0)
                                           split-point))
          (paint-top (transform-painter split-point
                                        (make-vect 1.0 0.5)
                                        (make-vect 0.0 1.0))))
      (lambda (frame)
        ((paint-bottom painter1) frame)
        ((paint-top painter2) frame)))))

(define e-dub (beside einstein einstein))

(paint (below einstein e-dub))


(define (below2 painter1 painter2)
  (rotate90 (beside (rotate270 painter1)
                    (rotate270 painter2))))

(paint (below2 einstein e-dub))