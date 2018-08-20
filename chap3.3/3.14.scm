#lang sicp

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

;; myster will reverse a list but it will alter the input list

(define v (list 'a 'b 'c 'd))
v
; {a b c d}

(define w (mystery v))
w
; {d c b a}

v
; {a}

;; the first thing mystery does is set the input list cdr to point to nil
;; subsequent loops don't update the orignal list anymore
;; so the result is a list containing only the first element