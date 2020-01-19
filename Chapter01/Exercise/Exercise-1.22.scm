(define (square x) (* x x))
(define (even? n)
    (= (remainder n 2) 0))
; 用从2开始的连续整数去检查它们能否整除n
(define (smallest-divisor n)
    (find-divisor n 2))
; 如果n不是素数，它必然有一个小于或者等于sqrt n的因子，所以只要在1和sqrt n之间检查因子就可以了，所以时间复杂度是sqrt n
; find-divisor过程可以找出当n不是素数时,n的最小因子
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
; 检查a是否是b的因子
(define (divides? a b)
    (= (remainder b a) 0))
; 检查n是否是素数，n是素数当且仅当它是自己的最小因子
(define (prime? n)
    (= n (smallest-divisor n)))
; -------------------------------------------------------
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
    (display "***")
    (display elapsed-time))
; -------------------------------------------------------
; 获取下一个奇数
(define (next-odd n)
    (if (even? n)
        (+ 1 n)
        (+ 2 n)))
; 从n开始查找3个最小素数
(define (search-for-primes n count)
    (let ((start-time (real-time-clock)))
        (cond ((= count 0) (display "are primes"))
        ((prime? n) (display n) (newline) (search-for-primes (next-odd n) (- count 1)))
        (else (search-for-primes (next-odd n) count)))
        (- (real-time-clock) start-time)))

; 测试：
; 1 ]=> (search-for-primes 1000 3) ; 一千
; 1009
; 1013
; 1019
; are primes
; ;Value: 1

; 1 ]=> (search-for-primes 10000 3) ; 一万
; 10007
; 10009
; 10037
; are primes
; ;Value: 1

; 1 ]=> (search-for-primes 100000 3) ; 十万
; 100003
; 100019
; 100043
; are primes
; ;Value: 3

; 1 ]=> (search-for-primes 1000000 3) ; 一百万
; 1000003
; 1000033
; 1000037
; are primes
; ;Value: 5

; 从运行时间上来看，当检查数据扩大10倍时，耗时并不是按照sqrt 10上升

