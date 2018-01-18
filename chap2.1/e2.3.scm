#lang sicp
(#%require "../lib/ch2-shared.scm")
(#%require "../lib/global-shared.scm")

;; rectangle from 3 points (top left and right and bottom right)
;; can be skewed, not 90 degree angles
(define (make-rect p1 p2 p4)
  (let ((p3 (make-point (+ (x-point p1) (x-diff p2 p4))
                        (+ (y-point p1) (y-diff p2 p4)))))
    (cons (cons p1 p2)
          (cons p3 p4))))

(define (x-diff p1 p2)
  (- (x-point p2) (x-point p1)))

(define (y-diff p1 p2)
  (- (y-point p2) (y-point p1)))

;; takes the top left point and bottom right point
;; simple rectangles with 90 degree angles
(define (make-simple-rect p1 p2)
  (make-rect p1
             (make-point (x-point p2)
                         (y-point p1))
             p2))
  
(define (top-left r)
  (car (car r)))

(define (top-right r)
  (cdr (car r)))

(define (bottom-left r)
  (car (cdr r)))

(define (bottom-right r)
  (cdr (cdr r)))


(define (distance p1 p2)
  (sqrt ( + (square (- (x-point p1)
                       (x-point p2)))
            (square (- (y-point p1)
                       (y-point p2))))))

(define (h-side r)
  (distance (top-left r) (top-right r)))

(define (v-side r)
  (distance (top-left r) (bottom-left r)))

(define (r-height r)
  (- (y-point (top-left r))
     (y-point (bottom-left r))))

(define (r-width r)
  (- (x-point (top-right r))
     (x-point (top-left r))))

(define (perimeter r)
  (+ (* 2 (h-side r))
     (* 2 (v-side r))))

(define (area r)
  (* (r-height r) (r-width r)))

(define p1 (make-point 2 10))

(define p4 (make-point 12 0))

; height = 10, width = 10
(define simple-rect (make-simple-rect p1 p4))

(perimeter simple-rect)
; 40

(area simple-rect)
; 100

(define p2 (make-point 14 7))

; height = 7, width = 12 (skewed)
(define skewed-rect (make-rect p1 p2 p4))

(perimeter skewed-rect)
; 39.298853532266996

(area skewed-rect)
; 84