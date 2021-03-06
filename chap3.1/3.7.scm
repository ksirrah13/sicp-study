#lang sicp

(define (make-account bal password)
  (define (withdraw amt)
    (if (> amt bal)
        "Insufficient funds"
        (begin (set! bal (- bal amt))
               bal)))
  (define (deposit amt)
    (set! bal (+ bal amt))
    bal)
  (define (dispatch proc)
    (cond ((eq? proc 'withdraw) withdraw)
          ((eq? proc 'deposit) deposit)
          (else (error "Unknown request" proc))))
  (secure-with-pass dispatch password))

(define (secure-with-pass disp password)
    (lambda (pass proc)
      (if (eq? pass password)
          (disp proc)
          (lambda (input) "Incorrect password"))))

(define (make-joint account account-pass new-pass)
  (define (dispatch proc)
    (cond ((eq? proc 'withdraw) (account account-pass 'withdraw))
          ((eq? proc 'deposit) (account account-pass 'deposit))
          (else (error "Unknown request" proc))))
  (secure-with-pass dispatch new-pass))

(define peter-acc (make-account 100 'abc))

(define paul-acc (make-joint peter-acc 'abc '123))

((peter-acc 'abc 'withdraw) 20)
; 80

((peter-acc '123 'withdraw) 20)
; "Incorrect password"

((paul-acc 'abc 'withdraw) 20)
; "Incorrect password"

((paul-acc '123 'withdraw) 20)
; 60

((peter-acc 'abc 'withdraw) 20)
; 40