(define (even? n)
    (= (remainder n 2) 0))

(define (square x) (* x x))
; 法一：寻找因子，其时间复杂度为o(sqrt n)
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
; -----------------------------------------
; 法二：使用费马小定理检查是否是素数，其时间复杂度为O(logn),关于费马小定理及其应用：https://www.jianshu.com/p/e3df7e5d9c38
; 计算一个base^exp%m，该过程类似fast-expt，采用连续求平方的方式
(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                        m))))
; n是需要检查的数，a是小于n的任意正整数，如果a^n%n=a，那么n是素数的可能性就很大。从1到(n-1)之间随机取一个数a来进行检测。
(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))
; 按times次对n进行检测，如果每次检测都成功，那么n就是一个素数
(define (fast-prime? n times)
    (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)))

; 费马检查其实是一个概率方法，因为能通过费马检查的n只表示他有很大概率是素数，但不能保证就是素数。
;   存在着一种数为Carmichael的数，也同样符合费马检查，但是却不是素数，这样的数在100000000之内有255个，但是如果在计算机求解的过程中，要碰上Carmichael数，其概率比宇宙射线导致计算机在执行“正确”算法中出错的机会还有小。
;   所以，算法只考虑在实践中的可靠性而不考虑在自然界的真理性也表现出数学与工程的不同。
; 另一方面，如果n对于某个随机选出的a能通过检查，n是素数的机会就大于一半。如果n对于两个随机选择的a能通过检查，n是素数的机会就大于四分之三。
;   因此，通过用更多随机选择的a值运行这一检查，我们就可以使出现错误的概率减小到所需要的任意程度。
; 这其实是概率算法的领域。概率素数检查在密码学中有着很重要的应用。虽然完成200位数的因数分解现在在计算机上还是不太容易实现的，但是费马检查可以在几秒钟内判断这么大数的素性。