#lang sicp
(#%require "../lib/streams.scm")

(define (partial-sums s)
  (define sums (cons-stream (stream-car s)
                            (add-streams sums (stream-cdr s))))
  sums)

(define i-partial (partial-sums integers))

(display-stream i-partial)
;1
;3
;6
;10
;15
;21
;28
;36
;45
;55
;66
;78
;91
;105
;120