#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define b3-2 (make-branch 3 2))
(define b2-3 (make-branch 2 3))
(define m2-3 (make-mobile b3-2 b2-3))

(define b4-m2-3 (make-branch 4 m2-3))
(define b2-m2-3 (make-branch 2 m2-3))
(define m (make-mobile b4-m2-3 b2-m2-3))


(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(total-weight m)
; 10

(define (balanced? mobile)
  (define (torque branch)
    (* (total-weight (branch-structure branch))
       (branch-length branch)))
  (cond ((null? mobile) #t)
        ((not (pair? mobile)) #t)
        (else (and (= (torque (left-branch mobile))
                      (torque (right-branch mobile)))
                   (and (balanced? (branch-structure (left-branch mobile)))
                        (balanced? (branch-structure (right-branch mobile))))))))

(balanced? m)
#f

(define sub-mob (make-mobile b4-m2-3 b4-m2-3))
(define sub-b (make-branch 5 sub-mob))
(define mob (make-mobile sub-b sub-b))

(total-weight mob)
20

(balanced? mob)
#t

;; only have to change accessors after change to make-mobile and make-branch
;(define (left-branch mobile)
;  (car mobile))
;
;(define (right-branch mobile)
;  (cdr mobile))
;
;(define (branch-length branch)
;  (car branch))
;
;(define (branch-structure branch)
;  (cdr branch))