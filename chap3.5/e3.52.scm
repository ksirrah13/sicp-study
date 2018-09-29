#lang sicp
(#%require "../lib/streams.scm")

(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq))

(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(stream-ref y 7)
; 136

(display-stream z)
;10
;15
;45
;55
;105
;120
;190
;210

;; If we didn't use memo-proc I believe the values could change signficantly dending on the value of sum
;; for example changing the value of sum between evaluations could change the next stream evaluation values

;(display-stream seq)

;(set! sum (* sum 10))

;(display-stream seq)