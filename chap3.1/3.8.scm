#lang sicp

(define f
  (let ((last 0)
        (x 0))
    (lambda (new)
      (set! last x)
      (set! x new)
      last)))

;; returns last passed value
(f 1)
; 0
(f 2)
; 1
(f 4)
; 2
(f 7)
; 4
(f 0)
; 7

;; reset to initial state
(f 0)

;; evaluate left to right
(f 0)
; 0
(f 1)
; 0
; (+ 0 0) = 0

;; reset to initial state
(f 0)

;; evaluate right to left
(f 1)
; 0
(f 0)
; 1
; (+ 1 0) = 1


(+ (f 0) (f 1))
; 0