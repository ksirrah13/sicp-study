#lang sicp

;; tree size n = 5
;; weights 2^n-1

;           ABCDE 31
;           /      \
;        ABCD 15   E 16
;        /     \
;      ABC 7   D 8
;     /    \
;   AB 3   C 4
;   /   \
;  A 1  B 2

;; tree n = 10... you get the idea

;; for tree size n
;; most frequent symbol requires 1 bit
;; least frequent symbol requires n-1 bits