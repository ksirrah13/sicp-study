#lang sicp

;A = Peter add 10
;B = Paul minus 20
;C = Mary minus half
;
;Starts with 100
;
;ABC = (100 + 10 - 20) / 2 = 45
;ACB = (100 + 10) / 2 - 20 = 35
;BAC = (100 - 20 + 10) / 2 = 45
;BCA = (100 - 20) / 2 + 10 = 50
;CAB = 100 / 2 + 10 - 20 = 40
;CBA = 100 / 2 - 20 + 10 = 40
;
;Interleaving
;Peter query balance = 100
;Paul query balance = 100
;Paul set balance 100 - 20 = 80
;Peter set balance 100 + 10 = 110
;Peter than Paul new balance = 110 (should be 90)
