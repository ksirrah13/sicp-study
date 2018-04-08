#lang sicp
(#%require "../lib/op-table.scm")

;; TEST DATA
(define (add-div-tag div-id file) (cons div-id file))
(define tag car)
(define content cdr)

;; M-Corp Data
(define m-corp-file
  '((Kyle 100000 Boss)
    (Joel 85000 Manager)))

(define (add-m-corp)
  (define tag 'm-corp)
  (define (get-record file emp)
    (assoc emp file))
  (define (get-salary record)
    (cadr record))
  (put 'get-record tag get-record)
  (put 'get-salary tag get-salary)
  'added-m-corp)
(add-m-corp)

;; OG Inc Data
(define g-inc-personnel
  '((Smith John CEO 78000)
    (Bond James ??? ???)))

(define (add-g-inc)
  (define tag 'g-inc)
  (define (get-record file emp)
    (let ((result (assoc emp
                         (map (lambda (record)
                                (cons (cadr record) record))
                              file))))
      (if result
          (cdr result)
          #f)))
  (define (get-salary record)
    (cadddr record))
  (put 'get-record tag get-record)
  (put 'get-salary tag get-salary)
  'added-g-inc)
(add-g-inc)

;; 2.74a
(define (get-record file employee)
  ((get 'get-record (tag file)) (content file) employee))

;; each division needs to tag their personnel file with a division identifier
;; and add their procedure for getting records by employee with their div-id tag
; (put 'get-record 'div-id-1 div-1-get-record)

(define m-file (add-div-tag 'm-corp m-corp-file))
(get-record m-file 'Kyle)
; {Kyle 100000 Boss}

(define g-file (add-div-tag 'g-inc g-inc-personnel))
(get-record g-file 'James)
; {Bond James ??? ???}

;; 2.74b
(define (get-salary-from-file file employee)
  (get-salary (get-tagged-record file employee)))

(define (get-salary record)
  (if record
      ((get 'get-salary (tag record)) (content record))
      (error "cannot get salary from empty record")))

;; as above in order for this to work the record needs a tag with the division id
;; however it's not necessary for the division to do this explicitly
;; we can modify our generic get-record generic procedure to do it for us
(define (get-tagged-record file employee)
  (let ((result (get-record file employee)))
    (if result
        (add-div-tag (tag file) result)
        #f)))

(get-salary-from-file m-file 'Joel)
; 85000

(get-salary-from-file g-file 'John)
; 78000

;; each division will need to provide a tagged procedure to get salary from a record
; (put 'get-salary 'div-id-1 div-1-get-salary)

;; 2.74c
(define (find-employee-record files employee)
  (if (null? files)
      #f
      (let ((result (get-tagged-record (car files) employee)))
        (if result
            result
            (find-employee-record (cdr files) employee)))))

(define personnel-files (list m-file g-file))

(get-salary (find-employee-record personnel-files 'Kyle))
; 100000

(get-salary (find-employee-record personnel-files 'James))
; ???

(find-employee-record personnel-files 'Bond)
; #f

;; 2.24d
;; to add a new personnel file each new division/company must tag their file
;; as well as provide specific procedures for accessing an employee record
;; and record information such as salary, name etc and add these procedures with the div tag