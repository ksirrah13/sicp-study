#lang sicp
(#%require "../lib/arithmetic.scm")
(#%require "../lib/op-table.scm")

(define (scheme-number->complex n)
  (make-complex-from-real-imag (contents n) 0))

(put-coercion 'scheme-number 'complex scheme-number->complex)

(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)
(put-coercion 'scheme-number 'scheme-number
              scheme-number->scheme-number)
(put-coercion 'complex 'complex complex->complex)

;; 2.28a
;; With the addition of coercion of types to themselves scheme->scheme
;; it will cause an infinite recursion loop when there is no procedure for those types

;; 2.28b
;; As it is the apply-generic will work, but it may search for coercion procedures for the same types
;; this is because if there is a procedure defined for the two types it won't do any coercion
;; If there is not a procedure it will try to coerce the arguements to try and find a matching procedure
;; however since we do not supply a coercion procedure to coerce types to themselves it will fail

;; 2.28c
;; Just to be safe to avoid the infinite recursion loop we'll add another condition to prevent
;; coecerion of two types to which are the same
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (not (eq? type1 type2))
                    (let ((t1->t2 (get-coercion type1 type2))
                          (t2->t1 (get-coercion type2 type1)))
                      (cond (t1->t2
                             (apply-generic op (t1->t2 a1) a2))
                            (t2->t1
                             (apply-generic op a1 (t2->t1 a2)))
                            (else
                             (error "No method for these types"
                                    (list op type-tags)))))
                    (error "No method for these types"
                           (list op type-tags))))
              (error "No method for these types"
                     (list op type-tags)))))))

(apply-generic 'add 6 (make-complex-from-real-imag 3 4))
; {complex rectangular 9 . 4}
