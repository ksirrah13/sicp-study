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
  (secure-with-pass dispatch password 7))

(define (secure-with-pass disp password attempt-limit)
    (let ((attempts 0))
      (lambda (pass proc)
        (define (success)
          (set! attempts 0)
          (disp proc))
        (define (fail)
          (set! attempts (inc attempts))
          (if (> attempts attempt-limit)
              (lambda (input) (call-the-cops))
              (lambda (input) "Incorrect password")))
        (define (call-the-cops) "WEE OOO WEE OOO!")
        (if (eq? pass password)
            (success)
            (fail)))))

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


;; 8 consecutive failed password attempts
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "WEE OOO WEE OOO!"


;; 8+ non consecutive password attempts
((my-acc '123abc 'withdraw) 20)
; 60
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123abc 'withdraw) 20)
; 40
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
((my-acc '123ABC 'withdraw) 20)
; "Incorrect password"
