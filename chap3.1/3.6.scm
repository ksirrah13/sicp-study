#lang sicp

(define (rand-update x)
  (let ((a 1664525)
        (c 1013904223)
        (m (expt 2 32)))
    (modulo (+ (* a x) c) m)))

(define rand-init 1)

(define rand
  (let ((x rand-init))
    (lambda (proc)
      (define (generate)
        (set! x (rand-update x))
        x)
      (define (reset seed)
        (set! x seed))
      (define (dispatch m)
        (cond ((eq? m 'generate) (generate))
              ((eq? m 'reset) reset)
              (else (error ("Unknown operation" m)))))
      (dispatch proc))))

(rand 'generate)
; 1013904223

(rand 'generate)
; 1586005467

(rand 'generate)
; 2165703038

(rand 'generate)
; 3027450565

((rand 'reset) 1)

(rand 'generate)
; 1013904223

(rand 'generate)
; 1586005467

(rand 'generate)
; 2165703038

(rand 'generate)
; 3027450565