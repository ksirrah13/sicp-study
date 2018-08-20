#lang sicp

(define (make-dequeue) (cons '() '()))
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (front-ptr queue)))

(define (new-q-item value next prev)
  (cons (cons value next) prev))
(define (value q-item)
  (caar q-item))
(define (next q-item)
  (cdar q-item))
(define (prev q-item)
  (cdr q-item))
(define (set-next! q-item next)
  (set-cdr! (car q-item) next))
(define (set-prev! q-item prev)
  (set-cdr! q-item prev))

(define (front-dequeue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (value (front-ptr queue))))

(define (rear-dequeue queue)
  (if (empty-queue? queue)
      (error "REAR called with an empty queue" queue)
      (value (rear-ptr queue))))

(define (front-delete-queue! queue)
  (if (empty-queue? queue)
      (error "FRONT-DELETE! called with an empty queue" queue)
      (begin (set-front-ptr! queue (next (front-ptr queue)))
             (print queue))))

(define (rear-delete-queue! queue)
  (if (empty-queue? queue)
      (error "REAR-DELETE! called with an empty queue" queue)
      (begin (set-rear-ptr! queue (prev (rear-ptr queue)))
             (set-next! (rear-ptr queue) '())
             (print queue))))

(define (front-insert-queue! queue item)
  (let ((new-item (new-q-item item (front-ptr queue) '())))
    (if (empty-queue? queue)
        (set-rear-ptr! queue new-item)
        (set-prev! (front-ptr queue) new-item))
    (set-front-ptr! queue new-item))
  (print queue))

(define (rear-insert-queue! queue item)
  (let ((new-item (new-q-item item '() (rear-ptr queue))))
    (if (empty-queue? queue)
        (set-front-ptr! queue new-item)
        (set-next! (rear-ptr queue) new-item))
    (set-rear-ptr! queue new-item))
  (print queue))

(define (print queue)
  (define (iter q-item result)
    (if (null? q-item)
        result
        (iter (next q-item) (cons (value q-item) result))))
  (reverse (iter (front-ptr queue) '())))

(define dq (make-dequeue))

(rear-insert-queue! dq 'a)
(rear-insert-queue! dq 'b)
(rear-insert-queue! dq 'c)
; {a}
; {a b}
; {a b c}

(front-insert-queue! dq 'z)
(front-insert-queue! dq 'x)
; {z a b c}
; {x z a b c}

(front-dequeue dq)
; x
(front-delete-queue! dq)
; {z a b c}

(rear-dequeue dq)
; c
(rear-delete-queue! dq)
; {z a b}

