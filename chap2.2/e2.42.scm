#lang sicp
(#%require "../lib/ch2-shared.scm")

(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define row-pos car)

(define col-pos cdr)

(define (make-pos row col)
  (cons row col))

(define (adjoin-position row col positions)
  (append positions (list (make-pos row col))))

(define (row-safe? new-pos test-pos)
  (not (= (row-pos new-pos) (row-pos test-pos))))

(define (diag-safe? new-pos test-pos)
  (let ((offset (- (col-pos new-pos) (col-pos test-pos))))
    (not (or (= (row-pos new-pos) (+ (row-pos test-pos) offset))
             (= (row-pos new-pos) (- (row-pos test-pos) offset))))))

(define (safe? col positions)
  (define (iter pos remaining result)
    (cond ((not result) #f)
          ((null? remaining) #t)
          (else (iter pos
                      (cdr remaining)
                      (and (row-safe? pos (car remaining))
                           (diag-safe? pos (car remaining)))))))
  (let ((reversed (reverse positions)))
    (iter (car reversed) (cdr reversed) #t)))

;; Only add a new position if its safe
(define (my-queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (= k (length positions)))
                (flatmap (lambda (prev-queens)
                           (map (lambda (new-row)
                                  (adjoin-if-safe new-row k prev-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-if-safe row col positions)
  (let ((new-pos (make-pos row col)))
    (if (new-safe? new-pos positions)
        (append positions (list new-pos))
        positions)))

(define (new-safe? new-pos positions)
  (define (iter remaining result)
    (cond ((not result) #f)
          ((null? remaining) #t)
          (else (iter (cdr remaining)
                      (and (row-safe? new-pos (car remaining))
                           (diag-safe? new-pos (car remaining)))))))
  (iter positions #t))

(queens 8)
;{{{1 . 1} {5 . 2} {8 . 3} {6 . 4} {3 . 5} {7 . 6} {2 . 7} {4 . 8}}
; {{1 . 1} {6 . 2} {8 . 3} {3 . 4} {7 . 5} {4 . 6} {2 . 7} {5 . 8}}
; {{1 . 1} {7 . 2} {4 . 3} {6 . 4} {8 . 5} {2 . 6} {5 . 7} {3 . 8}}
; {{1 . 1} {7 . 2} {5 . 3} {8 . 4} {2 . 5} {4 . 6} {6 . 7} {3 . 8}}
; {{2 . 1} {4 . 2} {6 . 3} {8 . 4} {3 . 5} {1 . 6} {7 . 7} {5 . 8}}
; {{2 . 1} {5 . 2} {7 . 3} {1 . 4} {3 . 5} {8 . 6} {6 . 7} {4 . 8}}
; {{2 . 1} {5 . 2} {7 . 3} {4 . 4} {1 . 5} {8 . 6} {6 . 7} {3 . 8}}
; {{2 . 1} {6 . 2} {1 . 3} {7 . 4} {4 . 5} {8 . 6} {3 . 7} {5 . 8}}
; {{2 . 1} {6 . 2} {8 . 3} {3 . 4} {1 . 5} {4 . 6} {7 . 7} {5 . 8}}
; {{2 . 1} {7 . 2} {3 . 3} {6 . 4} {8 . 5} {5 . 6} {1 . 7} {4 . 8}}
; {{2 . 1} {7 . 2} {5 . 3} {8 . 4} {1 . 5} {4 . 6} {6 . 7} {3 . 8}}
; {{2 . 1} {8 . 2} {6 . 3} {1 . 4} {3 . 5} {5 . 6} {7 . 7} {4 . 8}}
; {{3 . 1} {1 . 2} {7 . 3} {5 . 4} {8 . 5} {2 . 6} {4 . 7} {6 . 8}}
; {{3 . 1} {5 . 2} {2 . 3} {8 . 4} {1 . 5} {7 . 6} {4 . 7} {6 . 8}}
; {{3 . 1} {5 . 2} {2 . 3} {8 . 4} {6 . 5} {4 . 6} {7 . 7} {1 . 8}}
; {{3 . 1} {5 . 2} {7 . 3} {1 . 4} {4 . 5} {2 . 6} {8 . 7} {6 . 8}}
; {{3 . 1} {5 . 2} {8 . 3} {4 . 4} {1 . 5} {7 . 6} {2 . 7} {6 . 8}}
; {{3 . 1} {6 . 2} {2 . 3} {5 . 4} {8 . 5} {1 . 6} {7 . 7} {4 . 8}}
; {{3 . 1} {6 . 2} {2 . 3} {7 . 4} {1 . 5} {4 . 6} {8 . 7} {5 . 8}}
; {{3 . 1} {6 . 2} {2 . 3} {7 . 4} {5 . 5} {1 . 6} {8 . 7} {4 . 8}}
; {{3 . 1} {6 . 2} {4 . 3} {1 . 4} {8 . 5} {5 . 6} {7 . 7} {2 . 8}}
; {{3 . 1} {6 . 2} {4 . 3} {2 . 4} {8 . 5} {5 . 6} {7 . 7} {1 . 8}}
; {{3 . 1} {6 . 2} {8 . 3} {1 . 4} {4 . 5} {7 . 6} {5 . 7} {2 . 8}}
; {{3 . 1} {6 . 2} {8 . 3} {1 . 4} {5 . 5} {7 . 6} {2 . 7} {4 . 8}}
; {{3 . 1} {6 . 2} {8 . 3} {2 . 4} {4 . 5} {1 . 6} {7 . 7} {5 . 8}}
; {{3 . 1} {7 . 2} {2 . 3} {8 . 4} {5 . 5} {1 . 6} {4 . 7} {6 . 8}}
; {{3 . 1} {7 . 2} {2 . 3} {8 . 4} {6 . 5} {4 . 6} {1 . 7} {5 . 8}}
; {{3 . 1} {8 . 2} {4 . 3} {7 . 4} {1 . 5} {6 . 6} {2 . 7} {5 . 8}}
; {{4 . 1} {1 . 2} {5 . 3} {8 . 4} {2 . 5} {7 . 6} {3 . 7} {6 . 8}}
; {{4 . 1} {1 . 2} {5 . 3} {8 . 4} {6 . 5} {3 . 6} {7 . 7} {2 . 8}}
; {{4 . 1} {2 . 2} {5 . 3} {8 . 4} {6 . 5} {1 . 6} {3 . 7} {7 . 8}}
; {{4 . 1} {2 . 2} {7 . 3} {3 . 4} {6 . 5} {8 . 6} {1 . 7} {5 . 8}}
; {{4 . 1} {2 . 2} {7 . 3} {3 . 4} {6 . 5} {8 . 6} {5 . 7} {1 . 8}}
; {{4 . 1} {2 . 2} {7 . 3} {5 . 4} {1 . 5} {8 . 6} {6 . 7} {3 . 8}}
; {{4 . 1} {2 . 2} {8 . 3} {5 . 4} {7 . 5} {1 . 6} {3 . 7} {6 . 8}}
; {{4 . 1} {2 . 2} {8 . 3} {6 . 4} {1 . 5} {3 . 6} {5 . 7} {7 . 8}}
; {{4 . 1} {6 . 2} {1 . 3} {5 . 4} {2 . 5} {8 . 6} {3 . 7} {7 . 8}}
; {{4 . 1} {6 . 2} {8 . 3} {2 . 4} {7 . 5} {1 . 6} {3 . 7} {5 . 8}}
; {{4 . 1} {6 . 2} {8 . 3} {3 . 4} {1 . 5} {7 . 6} {5 . 7} {2 . 8}}
; {{4 . 1} {7 . 2} {1 . 3} {8 . 4} {5 . 5} {2 . 6} {6 . 7} {3 . 8}}
; {{4 . 1} {7 . 2} {3 . 3} {8 . 4} {2 . 5} {5 . 6} {1 . 7} {6 . 8}}
; {{4 . 1} {7 . 2} {5 . 3} {2 . 4} {6 . 5} {1 . 6} {3 . 7} {8 . 8}}
; {{4 . 1} {7 . 2} {5 . 3} {3 . 4} {1 . 5} {6 . 6} {8 . 7} {2 . 8}}
; {{4 . 1} {8 . 2} {1 . 3} {3 . 4} {6 . 5} {2 . 6} {7 . 7} {5 . 8}}
; {{4 . 1} {8 . 2} {1 . 3} {5 . 4} {7 . 5} {2 . 6} {6 . 7} {3 . 8}}
; {{4 . 1} {8 . 2} {5 . 3} {3 . 4} {1 . 5} {7 . 6} {2 . 7} {6 . 8}}
; {{5 . 1} {1 . 2} {4 . 3} {6 . 4} {8 . 5} {2 . 6} {7 . 7} {3 . 8}}
; {{5 . 1} {1 . 2} {8 . 3} {4 . 4} {2 . 5} {7 . 6} {3 . 7} {6 . 8}}
; {{5 . 1} {1 . 2} {8 . 3} {6 . 4} {3 . 5} {7 . 6} {2 . 7} {4 . 8}}
; {{5 . 1} {2 . 2} {4 . 3} {6 . 4} {8 . 5} {3 . 6} {1 . 7} {7 . 8}}
; {{5 . 1} {2 . 2} {4 . 3} {7 . 4} {3 . 5} {8 . 6} {6 . 7} {1 . 8}}
; {{5 . 1} {2 . 2} {6 . 3} {1 . 4} {7 . 5} {4 . 6} {8 . 7} {3 . 8}}
; {{5 . 1} {2 . 2} {8 . 3} {1 . 4} {4 . 5} {7 . 6} {3 . 7} {6 . 8}}
; {{5 . 1} {3 . 2} {1 . 3} {6 . 4} {8 . 5} {2 . 6} {4 . 7} {7 . 8}}
; {{5 . 1} {3 . 2} {1 . 3} {7 . 4} {2 . 5} {8 . 6} {6 . 7} {4 . 8}}
; {{5 . 1} {3 . 2} {8 . 3} {4 . 4} {7 . 5} {1 . 6} {6 . 7} {2 . 8}}
; {{5 . 1} {7 . 2} {1 . 3} {3 . 4} {8 . 5} {6 . 6} {4 . 7} {2 . 8}}
; {{5 . 1} {7 . 2} {1 . 3} {4 . 4} {2 . 5} {8 . 6} {6 . 7} {3 . 8}}
; {{5 . 1} {7 . 2} {2 . 3} {4 . 4} {8 . 5} {1 . 6} {3 . 7} {6 . 8}}
; {{5 . 1} {7 . 2} {2 . 3} {6 . 4} {3 . 5} {1 . 6} {4 . 7} {8 . 8}}
; {{5 . 1} {7 . 2} {2 . 3} {6 . 4} {3 . 5} {1 . 6} {8 . 7} {4 . 8}}
; {{5 . 1} {7 . 2} {4 . 3} {1 . 4} {3 . 5} {8 . 6} {6 . 7} {2 . 8}}
; {{5 . 1} {8 . 2} {4 . 3} {1 . 4} {3 . 5} {6 . 6} {2 . 7} {7 . 8}}
; {{5 . 1} {8 . 2} {4 . 3} {1 . 4} {7 . 5} {2 . 6} {6 . 7} {3 . 8}}
; {{6 . 1} {1 . 2} {5 . 3} {2 . 4} {8 . 5} {3 . 6} {7 . 7} {4 . 8}}
; {{6 . 1} {2 . 2} {7 . 3} {1 . 4} {3 . 5} {5 . 6} {8 . 7} {4 . 8}}
; {{6 . 1} {2 . 2} {7 . 3} {1 . 4} {4 . 5} {8 . 6} {5 . 7} {3 . 8}}
; {{6 . 1} {3 . 2} {1 . 3} {7 . 4} {5 . 5} {8 . 6} {2 . 7} {4 . 8}}
; {{6 . 1} {3 . 2} {1 . 3} {8 . 4} {4 . 5} {2 . 6} {7 . 7} {5 . 8}}
; {{6 . 1} {3 . 2} {1 . 3} {8 . 4} {5 . 5} {2 . 6} {4 . 7} {7 . 8}}
; {{6 . 1} {3 . 2} {5 . 3} {7 . 4} {1 . 5} {4 . 6} {2 . 7} {8 . 8}}
; {{6 . 1} {3 . 2} {5 . 3} {8 . 4} {1 . 5} {4 . 6} {2 . 7} {7 . 8}}
; {{6 . 1} {3 . 2} {7 . 3} {2 . 4} {4 . 5} {8 . 6} {1 . 7} {5 . 8}}
; {{6 . 1} {3 . 2} {7 . 3} {2 . 4} {8 . 5} {5 . 6} {1 . 7} {4 . 8}}
; {{6 . 1} {3 . 2} {7 . 3} {4 . 4} {1 . 5} {8 . 6} {2 . 7} {5 . 8}}
; {{6 . 1} {4 . 2} {1 . 3} {5 . 4} {8 . 5} {2 . 6} {7 . 7} {3 . 8}}
; {{6 . 1} {4 . 2} {2 . 3} {8 . 4} {5 . 5} {7 . 6} {1 . 7} {3 . 8}}
; {{6 . 1} {4 . 2} {7 . 3} {1 . 4} {3 . 5} {5 . 6} {2 . 7} {8 . 8}}
; {{6 . 1} {4 . 2} {7 . 3} {1 . 4} {8 . 5} {2 . 6} {5 . 7} {3 . 8}}
; {{6 . 1} {8 . 2} {2 . 3} {4 . 4} {1 . 5} {7 . 6} {5 . 7} {3 . 8}}
; {{7 . 1} {1 . 2} {3 . 3} {8 . 4} {6 . 5} {4 . 6} {2 . 7} {5 . 8}}
; {{7 . 1} {2 . 2} {4 . 3} {1 . 4} {8 . 5} {5 . 6} {3 . 7} {6 . 8}}
; {{7 . 1} {2 . 2} {6 . 3} {3 . 4} {1 . 5} {4 . 6} {8 . 7} {5 . 8}}
; {{7 . 1} {3 . 2} {1 . 3} {6 . 4} {8 . 5} {5 . 6} {2 . 7} {4 . 8}}
; {{7 . 1} {3 . 2} {8 . 3} {2 . 4} {5 . 5} {1 . 6} {6 . 7} {4 . 8}}
; {{7 . 1} {4 . 2} {2 . 3} {5 . 4} {8 . 5} {1 . 6} {3 . 7} {6 . 8}}
; {{7 . 1} {4 . 2} {2 . 3} {8 . 4} {6 . 5} {1 . 6} {3 . 7} {5 . 8}}
; {{7 . 1} {5 . 2} {3 . 3} {1 . 4} {6 . 5} {8 . 6} {2 . 7} {4 . 8}}
; {{8 . 1} {2 . 2} {4 . 3} {1 . 4} {7 . 5} {5 . 6} {3 . 7} {6 . 8}}
; {{8 . 1} {2 . 2} {5 . 3} {3 . 4} {1 . 5} {7 . 6} {4 . 7} {6 . 8}}
; {{8 . 1} {3 . 2} {1 . 3} {6 . 4} {2 . 5} {5 . 6} {7 . 7} {4 . 8}}
; {{8 . 1} {4 . 2} {1 . 3} {3 . 4} {6 . 5} {2 . 6} {7 . 7} {5 . 8}}}