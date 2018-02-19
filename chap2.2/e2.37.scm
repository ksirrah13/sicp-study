#lang sicp
(#%require "../lib/ch2-shared.scm")

(define matrix (list (list 1 2 3 4)
                     (list 4 5 6 6)
                     (list 6 7 8 9)))

(define vector (list 1 2 3 4))

(define vector2 (list 4 5 2 3))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product vector vector2)
; 1*4 + 2*5 + 3*2 + 4*3
; 4 + 10 + 6 + 12
; 32

(define (matrix-*-vector m v)
  (map (lambda (vect) (dot-product vect v)) m))

(matrix-*-vector matrix vector)
; {30 56 80}

(define (transpose mat)
  (accumulate-n cons nil mat))

matrix
; {{1 2 3 4} {4 5 6 6} {6 7 8 9}}

(transpose matrix)
; {{1 4 6} {2 5 7} {3 6 8} {4 6 9}}

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-vect)
           (map (lambda (n-vect)
                  (dot-product m-vect n-vect))
                cols))
         m)))

(matrix-*-matrix matrix (transpose matrix))
; {{30 56 80} {56 113 161} {80 161 230}}
