#lang sicp
(#%require "../lib/arithmetic.scm")
(#%require "../lib/op-table.scm")

(define (coerce-args-to-type target args)
  (define (iter args coerced-args changed)
    (if (null? args)
        (if changed (reverse coerced-args) #f)
        (let ((t1 (type-tag (car args)))
              (a1 (car args)))
          (if (eq? t1 target)
              (iter (cdr args) (cons a1 coerced-args) changed)
              (let ((proc (get-coercion t1 target)))
                (if proc
                    (iter (cdr args) (cons (proc a1) coerced-args) #t)
                    #f))))))
  (iter args '() #f))

(define (apply-coerced op args types)
  (define (iter target remaining)
    (let ((coerced (coerce-args-to-type target args)))
      (if coerced
          (let ((proc (get op (map type-tag coerced))))
            (if proc
                (apply proc (map contents coerced))
                (try-next-type remaining)))
          (try-next-type remaining))))
  (define (try-next-type remaining)
    (if (null? remaining)
        (error "No method for these types" types)
        (iter (car remaining) (cdr remaining))))
  (iter (car types) (cdr types)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (> (length args) 1)
              (apply-coerced op args type-tags)
              (error "No method for these types" type-tags))))))


(define (scheme-number->complex n)
  (make-complex-from-real-imag (contents n) 0))
(put-coercion 'scheme-number 'complex scheme-number->complex)

(apply-generic 'add 4 5)
; 9

(apply-generic 'add 6 (make-complex-from-real-imag 3 4))
; {complex rectangular 9 . 4}

(apply-generic 'add (make-complex-from-real-imag 3 4) 6)
; {complex rectangular 9 . 4}

