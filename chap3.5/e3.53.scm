#lang sicp
(#%require "../lib/streams.scm")

(define s (cons-stream 1 (add-streams s s)))

;s = ( 1 and promise to add s to s)
;adding car s to car s gives (1 + 1) = 2 and promsie to add cdr s to cdr s
;cdr s = s1 = result of car s1 = 2 and promise to add cdr s1 to cdr s1
;'(1 2 4 8 16 ...)
;
;in other words you start a stream with 1
;then to get the next promised value you have to add that stream to itself
;well to add the two streams you start by adding the first value which is 1
;but what is the second value? well you just computed it, 2
;so how do you get the third value? by adding the second value to itself 2 + 2 = 4
;so the stream is creating itself by supplying only the arguments necessary
;to create the very next value just before they will be needed.

(stream-ref s 2)
;4
(stream-ref s 3)
;8
(stream-ref s 4)
;16

(display-stream s)