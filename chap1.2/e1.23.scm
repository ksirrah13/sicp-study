#lang sicp
(#%require "../lib/ch1-shared.scm")

(define (find-divisor n test-divisor)
  (define (next-test n)
    (if (= n 2)
        3
        (+ n 2)))
  (cond ((> (square test-divisor) n) n)
        ((divide? test-divisor n) test-divisor)
        (else (find-divisor n (next-test test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime total-time)
  (display " *** ")
  (display total-time))

(define (search-for-primes start end)
  (cond ((> start end) (newline)
                       (display "*** DONE ***"))
        ((even? start) (search-for-primes (inc start) end))
        (else (timed-prime-test start)
              (search-for-primes (inc start) end))))

(search-for-primes 1000 1020)
;1001
;1003
;1005
;1007
;1009 *** 6
;1011
;1013 *** 6
;1015
;1017
;1019 *** 6
;*** DONE ***

(search-for-primes 10000 10038)
;10001
;10003
;10005
;10007 *** 11
;10009 *** 12
;10011
;10013
;10015
;10017
;10019
;10021
;10023
;10025
;10027
;10029
;10031
;10033
;10035
;10037 *** 11

(search-for-primes 100000 100044)
;100001
;100003 *** 30
;100005
;100007
;100009
;100011
;100013
;100015
;100017
;100019 *** 30
;100021
;100023
;100025
;100027
;100029
;100031
;100033
;100035
;100037
;100039
;100041
;100043 *** 30

(search-for-primes 1000000 1000038)
;1000001
;1000003 *** 90
;1000005
;1000007
;1000009
;1000011
;1000013
;1000015
;1000017
;1000019
;1000021
;1000023
;1000025
;1000027
;1000029
;1000031
;1000033 *** 89
;1000035
;1000037 *** 89
;*** DONE ***
