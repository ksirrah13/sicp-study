#lang sicp

(define (make-monitored f)
  (let ((count 0))
    (lambda (arg)
      (if (eq? arg 'how-many-calls?)
          count
          (begin (set! count (inc count))
                 (f arg))))))

(define (square x)
  (* x x))

(square 3)
; 9

(define s (make-monitored square))

(s 'how-many-calls?)
; 0

(s 2)
;4

(s 3)
; 9

(s 'how-many-calls?)
; 2