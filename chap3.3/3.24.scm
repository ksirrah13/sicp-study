#lang sicp

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (get-for-key key-1 (cdr local-table))))
        (if subtable
            (let ((record (get-for-key key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (get-for-key key-1 (cdr local-table))))
        (if subtable
            (let ((record (get-for-key key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)
    (define (get-for-key key table)
      (cond ((null? table) #f)
            ((not (pair? (car table))) #f)
            ((same-key? key (caar table)) (car table))
            (else (get-for-key key (cdr table)))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define equal-table (make-table equal?))

((equal-table 'insert-proc!) 3 1 'fluffy)
((equal-table 'insert-proc!) 3 1.0 'duffy)

((equal-table 'lookup-proc) 3 1)
; fluffy
; does not get overwritten because 1 and 1.o are different keys

(define num-table (make-table =))

((num-table 'insert-proc!) 3 1 'fluffy)
((num-table 'insert-proc!) 3 1.0 'duffy)

((num-table 'lookup-proc) 3 1)
; duffy
; 1 and 1.0 are seen as the same key so fluffy is replaced with duffy

