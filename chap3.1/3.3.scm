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
  (define (dispatch pass proc)
    (define (secure proc)
      (if (eq? pass password)
          proc
          (lambda (input) "Incorrect password")))
    (cond ((eq? proc 'withdraw) (secure withdraw))
          ((eq? proc 'deposit) (secure deposit))
          (else (error "Unknown request" proc))))
  dispatch)

(define my-acc (make-account 100 '123abc))

((my-acc '123abc 'withdraw) 40)
; 60

((my-acc '123abc 'withdraw) 80)
; "Insufficient funds"

((my-acc 'wrong 'deposit) 100)
; "Incorrect password"

((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"

;((my-acc '123abc 'boom) 99)
; Unknow request boom

((my-acc '123abc 'deposit) 100)
; 160

((my-acc '123abc 'withdraw) 80)
; 80