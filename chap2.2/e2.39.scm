#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define seq (list 1 2 3 4))

(reverse-r seq)
; {4 3 2 1}

(reverse-l seq)
; {4 3 2 1}
