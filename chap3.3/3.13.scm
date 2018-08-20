#lang sicp


(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

;; sets the last pair in the list to point tot he first
;; rather than pointing to the null terminator

(define z (make-cycle (list 'a 'b 'c)))

;; this will run forever
; (last-pair z)