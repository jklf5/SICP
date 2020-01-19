; 可以通过“覆盖”的方法重写其他文件中的过程，这样可以提高复用效率
(load "Exercise-1.22.scm")
; 定义next过程
(define (next n)
    (if (even? n)
        (+ 1 n)
        (+ 2 n)))
; 重写find-divisor过程
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor))))) ; 运用新的next过程

; 测试：
; 1 ]=> (search-for-primes 1000 3)
; 1009
; 1013
; 1019
; are primes
; ;Value: 1

; 1 ]=> (search-for-primes 10000 3)
; 10007
; 10009
; 10037
; are primes
; ;Value: 1

; 1 ]=> (search-for-primes 100000 3)
; 100003
; 100019
; 100043
; are primes
; ;Value: 2

; 1 ]=> (search-for-primes 1000000 3)
; 1000003
; 1000033
; 1000037
; are primes
; ;Value: 5

; 从测试中运行时间可以看出，当使用新的smallest-divisor过程后，运行速度有所提升，但是其运行速度并没有题中所说的快一倍