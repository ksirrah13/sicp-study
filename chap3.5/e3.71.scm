#lang sicp
(#%require "../lib/streams.scm")

(define (cube x)
  (* x x x))

(define (sum-cube-pair p)
  (+ (cube (car p)) (cube (cadr p))))

(define sum-of-cubes (weighted-pairs sum-cube-pair
                                     integers
                                     integers))

(define (Ramanujan s last)
  (let ((first (stream-car s))
        (second (stream-car (stream-cdr s))))
    (let ((sum1 (sum-cube-pair first))
          (sum2 (sum-cube-pair second)))
      (if (and (= sum1 sum2)
               (not (= sum1 last)))
          (cons-stream sum1
                       (Ramanujan (stream-cdr (stream-cdr s)) sum1))
          (Ramanujan (stream-cdr s) last)))))

(display-stream (Ramanujan sum-of-cubes 0))
;1729
;4104
;13832
;20683
;32832
;39312
;40033
;46683
;64232
;65728
;110656
;110808
;134379