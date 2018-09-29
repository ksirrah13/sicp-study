#lang sicp
(#%provide (all-defined))


(define (stream-car s)
  (car s))

(define (stream-cdr s)
  (force (cdr s)))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream (apply proc (map stream-car argstreams))
                   (apply stream-map (cons proc (map stream-cdr argstreams))))))

(define (scale-stream s scale)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (* scale (stream-car s))
                   (scale-stream (stream-cdr s) scale))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each-safe proc (stream-cdr s) 1))))

(define (stream-for-each-safe proc s num)
  (if (or (> num 30) (stream-null? s))
      'done
      (begin (proc (stream-car s))
             (stream-for-each-safe proc (stream-cdr s) (inc num)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream low
                   (stream-enumerate-interval (inc low) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define (integers-starting-from n) (cons-stream n (integers-starting-from (inc n))))
(define integers (integers-starting-from 1))

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (merge-weighted weight s1 s2)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let ((s1car (stream-car s1))
               (s2car (stream-car s2))
               (weight-s1car (weight (stream-car s1)))
               (weight-s2car (weight (stream-car s2))))
           (if (< weight-s1car weight-s2car)
               (cons-stream s1car (merge-weighted weight (stream-cdr s1) s2))
               (cons-stream s2car (merge-weighted weight s1 (stream-cdr s2))))))))

(define (weighted-pairs weight s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted weight
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (weighted-pairs weight (stream-cdr s) (stream-cdr t)))))

(define (list->stream l)
  (if (null? l)
      the-empty-stream
      (cons-stream (car l) (list->stream (cdr l)))))

(define (integral integrand init-value dt)
  (define int
    (cons-stream init-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)