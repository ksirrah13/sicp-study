#lang sicp

(define (cycle? x)
  (let ((seen '()))
    (define (test remaining)
      (cond ((not (pair? remaining)) #f)
            ((memq (cdr remaining) seen) #t)
            (else (begin (set! seen (cons remaining seen))
                         (test (cdr remaining))))))
  (test x)))

(define inf (cons 'a (cons 'b (cons 'c nil))))
(set-cdr! (cddr inf) inf)

(cycle? inf)
; #t

(define z (list 'a 'b 'c))

(cycle? z)
; #f