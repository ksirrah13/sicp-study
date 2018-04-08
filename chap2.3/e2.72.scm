#lang sicp

;; because at each step in the encoding tree we search a set of symbols it takes O(n) for a single branch
;; and we have to search again after decending each branch, in the special case the deepest branch is O(n) steps down
;; so worst case is O(n^2) and most frequent symbol would take O(n) to just search the first branch

;; if the tree were more balanced we may not have to decend O(n) steps down and be closer to O(log n)
;; same with searching the symbols in the set at each branch since they would be divided more evenly
;; so worst case for a well balanced huffman tree would be O(log^2 n)