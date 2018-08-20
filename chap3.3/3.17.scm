#lang sicp

(define (count-pairs x)
  (let ((counted '()))
    (define (counter to-count)
      (if (or (not (pair? to-count))
              (memq to-count counted))
          0
          (begin
            (set! counted (cons to-count counted))
            (+ (counter (car to-count))
               (counter (cdr to-count))
               1))))
    (counter x)))

(define three (cons 'a (cons 'b (cons 'c nil))))
(count-pairs three)
; 3

(define a-pair (cons 'a nil))
(count-pairs a-pair)
; 1

(define four (cons a-pair (cons a-pair nil)))
(count-pairs four)
; 3

(define b-pair (cons a-pair a-pair))
(count-pairs b-pair)
; 2

(define seven (cons b-pair b-pair))
(count-pairs seven)
; 3

(define inf (cons 'a (cons 'b (cons 'c nil))))
(set-cdr! (cddr inf) inf)
(count-pairs inf)
; 3