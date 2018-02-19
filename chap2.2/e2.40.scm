#lang sicp
(#%require "../lib/ch2-shared.scm")
(#%require "../lib/global-shared.scm")

(accumulate append
            nil
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 5)))
; {{2 1} {3 1} {3 2} {4 1} {4 2} {4 3} {5 1} {5 2} {5 3} {5 4}}

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(prime-sum? (list 4 1))
; #t

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(make-pair-sum (list 4 1))
; {4 1 5}

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(prime-sum-pairs 5)
; {{2 1 3} {3 2 5} {4 1 5} {4 3 7} {5 2 7}}

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(unique-pairs 3)
; {{2 1} {3 1} {3 2}}

(define (unique-prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(unique-prime-sum-pairs 5)
; {{2 1 3} {3 2 5} {4 1 5} {4 3 7} {5 2 7}}