(define (square x)
    (* x x))
(define (even? n)
    (= (remainder n 2) 0))
; 非平凡平方根检查。存在a不等于1或者不等于n-1，其平方取模n等于1时，n就不是素数
(define (Nontrivial-square-root? a n)
    (and (not (= a 1))
        (not (= a (- n 1)))
        (= (remainder (square a) n) 1)))
; 计算base^exp % m，同时加入非平凡平方根检查
(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((Nontrivial-square-root? base m) 0)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                        m))))
; 用miller-rabin的方法检查n
(define (miller-rabin-test n)
    (define (try-it a)
        (= (expmod a (- n 1) n) 1))
    (try-it (+ 1 (random (- n 1)))))
; 检查n是否是prime
(define (check-prime n times)
    (cond ((= times 0) #t)
            ((miller-rabin-test n) (check-prime n (- times 1)))
            (else #f)))
; 执行n/2次检查如果都通过，就可以保证结果的准确性。
(define (fast-prime? n)
    (if (= n 1)
        #t
        (let ((times (ceiling (/ n 2))))
            (check-prime n times))))

; Miller-Rabin检查：
; Miller-Rabin检查是在费马检查的基础上改进的，它也可以避开Carmichael数。
; 其原理是如果n是素数，a<n，则a^(n-1) % n=1，也要检查是否会遇到“1取模n的非平凡平方根”
; 如果n是非素数的奇数，那么，至少有一半的数a<n,按照这种方式计算a^(n-1)，将会遇到1取模n的非平凡平方根，所以，在检查的时候，需要检查n/2次
; Miller-Rabin检查也是一个概率算法