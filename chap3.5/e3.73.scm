#lang sicp
(#%require "../lib/streams.scm")

(define (RC R C dt)
  (lambda (i v0)
    (cons-stream v0
                 (add-streams (scale-stream i R)
                              (integral (scale-stream i (/ 1 C)) v0 dt)))))

(define current (list->stream '(0 0 1 0 0 0 2 0 0)))

(define RC1 (RC 5 1 0.5))
(display-stream (RC1 current 0))
;0
;0
;0
;5
;0.5
;0.5
;0.5
;10.5
;1.5
;1.5

(display-stream (RC1 integers 0))
;0
;5
;10.5
;16.5
;23.0
;30.0
;37.5
;45.5
;54.0
;63.0
;72.5