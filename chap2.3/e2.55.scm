#lang sicp

(car ''abracadabra)
; quote

(car '(abracadabra))
; abracadabra

(car (quote (list abracadabra)))
; list

(car (quote (quote abracadabra)))
; quote

;; The ' symbol is syntatic sugar for (quote ?) so longhand its (quote (quote abracadabra))
;; what quote does is treat the following expression or symbols as literals
;; so the first quote is saying is don't evaluate what follows
;; and what follows is a list containing two symbols (quote abracadabra)
;; so the car of that list of symbols is quote

(cadr ''abracadabra)
; abracadabra