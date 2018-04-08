#lang sicp

;;; EXPLICIT DISPATCH

;; To add new operation
;; add new procedures for the operation for each existing type
;; add a new generic procedure that dispatches to each new type operation

;; To add new type
;; add a procedure for the new type for each of the existing generic operations
;; MODIFY all existing generic operation methods to displatch to the new type


;;; DATA DIRECTED
;; To add new operation
;; MODIFY all existing type packages to regsiter procedures for the new operation
;; add a new generic procedure that gets the operation procedure by type

;; To add new type
;; add new package that registers procedures for each existing generic procedure


;;; MESSAGE PASSING
;; To add new operation
;; MODIFY all existing type constructing procedures to accept a new operation

;; To add a new type
;; add new type constructor that accepts any of ther generic operations


;; For a system that adds new types often either data directed or message passing would be best
;; if generic procedures will only operate on a single data object argument
;; then message passing might be preferable to not have to manage a global registry

;; For a system that adds new operations often explicit dispatch will likely have the least necessary modification
;; this is because with data directed you would have to modify the existing package to add and register the new operation
;; with explicit dispatch however you will have to worry about unique naming
;; Alternatively you could use the data directed approach and not modify existing packages but just register new operations
;; however over time this would result in implementations for types being spread across multiple packages