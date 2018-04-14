#lang sicp
(#%require "../lib/arithmetic.scm")
(#%require "../lib/op-table.scm")

(define z (make-complex-from-real-imag 3 4))
; {complex rectangular 3 . 4}

;(magnitude z)
; No method for these types -- APPLY-GENERIC {magnitude {complex}}

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

(magnitude z)
; 5

;; This works because the most outer tag, complex, is evaluated first
;; which looks into the complex package for the magnitude op
;; previously this op was not defined for the complex package which resulted in error
;; After defining the op in complex, the apply generic proc will strip off the complex tag
;; and pass the argument to the generic magnitude op which evaluates the now outer most tag
;; this tag is rectangular so it will now look into this package for its implementation of magnitude