#lang sicp

;(flatmap
; (lambda (new-row)
;   (map (lambda (rest-of-queens)
;          (adjoin-position new-row k rest-of-queens))
;        (queen-cols (- k 1))))
; (enumerate-interval 1 board-size))

;; reversing the order this way will result in calling queen-cols numerous times
;; this is essentially changing the recursion from a linear recursion to tree recursion
;; because each recursion we split off into between 1-8 new recursive calls
;; not sure the specific time multiplier but tree recursion is exponential
;; so probably something like T^8 for eight queens