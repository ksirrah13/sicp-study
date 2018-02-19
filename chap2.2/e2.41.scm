#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (ordered-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(ordered-triples 5)
; {{3 2 1} {4 2 1} {4 3 1} {4 3 2} {5 2 1} {5 3 1} {5 3 2} {5 4 1} {5 4 2} {5 4 3}}

(define (triples-equal-sum s n)
  (define (make-result trip)
    (list (accumulate + 0 trip) trip))
  (map make-result
       (filter (lambda (t) (= s (accumulate + 0 t)))
               (ordered-triples n))))

(triples-equal-sum 10 5)
; {{10 {5 3 2}} {10 {5 4 1}}}

