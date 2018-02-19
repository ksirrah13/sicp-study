#lang sicp

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define origin-frame1 car)

(define edge1-frame1 cadr)

(define edge2-frame1 caddr)

(define f1 (make-frame1 0 1 2))

(origin-frame1 f1)
; 0
(edge1-frame1 f1)
; 1
(edge2-frame1 f1)
; 2

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define origin-frame2 car)

(define edge1-frame2 cadr)

(define edge2-frame2 cddr)

(define f2 (make-frame2 0 1 2))

(origin-frame2 f2)
; 0
(edge1-frame2 f2)
; 1
(edge2-frame2 f2)
; 2