#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
; 2

; normal order expansion
;(gcd 206 40)
;(if (= 40 0))...
;(gcd 40 (remainder 206 40))
;(if (= (remainder 206 40) 0))...
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;...
