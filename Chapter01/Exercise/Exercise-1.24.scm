(load "Exercise-1.22.scm")
(load "../Example/Example-1.2.6-Testing for Primality.scm")
; 重写Exercise-1.22.scm中search-for-primes过程所要用的prime?过程，primes?过程使用费马检查
(define (prime? n)
    (fast-prime? n 10))

; 测试：
; 1 ]=>  (search-for-primes 1000 3) ; 一千  
; 1009
; 1013
; 1019
; are primes
; ;Value: 3

; 1 ]=> (search-for-primes 10000 3) ; 一万
; 10007
; 10009
; 10037
; are primes
; ;Value: 4

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
; ;Value: 7

; 1 ]=> (search-for-primes 100000000 3) ; 一亿
; 100000007
; 100000037
; 100000039
; are primes
; ;Value: 7

; 1 ]=> (search-for-primes 1000000000000 3) ; 一万亿
; 1000000000039
; 1000000000061
; 1000000000063
; are primes
; ;Value: 13

; 结论：计算所需时间并没有向预期那样，严格按照常数增长。

; 总结：通过对练习1.22，练习1.23，练习1.24的运行比较，可以发现，使用算法复杂度和计算步数并不能完全预测程序的运行时间。因为运行时还受很多因素的制约。
;     并且算法复杂度考虑的是增长速度的快慢，在数据量小的时候较难看出，但是当数据量大的时候，算法复杂度低的算法比算法复杂度高的算法更快。
;     比如在练习1.24中最后测试的数据量达到一万亿的时候，运行时间并没有增长的很快