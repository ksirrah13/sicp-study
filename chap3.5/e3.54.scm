#lang sicp
(#%require "../lib/streams.scm")

(define (integers-starting-from n) (cons-stream n (integers-starting-from (inc n))))
(define integers (integers-starting-from 1))

(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams factorials (integers-starting-from 2))))

(display-stream factorials)
;1
;2
;6
;24
;120
;720
;5040
;40320
;362880
;3628800