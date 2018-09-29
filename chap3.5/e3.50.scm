#lang sicp
(#%require "../lib/streams.scm")

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))


(define one-to-ten (stream-enumerate-interval 1 10))
(define mapped (stream-map + one-to-ten one-to-ten))
(display-stream mapped)
;2
;4
;6
;8
;10
;12
;14
;16 
;18
;20