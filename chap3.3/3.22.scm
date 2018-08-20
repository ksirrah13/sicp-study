#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (insert! item)
      (let ((new-item (cons item nil)))
        (if (empty-queue?)
            (begin (set! front-ptr new-item)
                   (set! rear-ptr new-item))
            (begin (set-cdr! rear-ptr new-item)
                   (set! rear-ptr new-item)))))
    (define (delete!)
      (if (empty-queue?)
          (error "Can not delete from empty queue")
          (set! front-ptr (cdr front-ptr))))
    (define (empty-queue?)
      (null? front-ptr))
    (define (front)
      (if (empty-queue?)
          (error "Can not get front of empty queue")
          (car front-ptr)))
    (define (dispatch m)
      (cond ((eq? m 'insert) insert!)
            ((eq? m 'delete) delete!)
            ((eq? m 'front) front)
            ((eq? m 'print) front-ptr)
            (else (error "uknown argument" m))))
    dispatch))

(define q (make-queue))
(q 'print)
; ()
((q 'insert) 'a)
((q 'insert) 'b)
(q 'print)
; {a b}
((q 'front))
; a
((q 'insert) 'c)
(q 'print)
; {a b c}
((q 'delete))
(q 'print)
; {b c}
((q 'front))
; b

      