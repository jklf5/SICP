(load "Exercise-1.28.scm") ; 导入使用Miller-Rabin检查的fast-prime？过程
(load "../Example/Example-1.2.5-Greatest Common Divisors.scm") ; 导入GCD过程
; 加入过滤器filter后更一般的accumulate过程（迭代计算过程），可以按照filter要求进行term后combine
(define (filtered-accumulte-iter filter combine null-value term a next b)
    (define (iter i result)
        (cond ((> i b) result)
            ((filter i) (iter (next i) (combine result (term i))))
            (else (iter (next i) result))))
    (iter a null-value))
; a)计算a到b区间内所有素数的平方和（勘误过）--------------------------------
; 用miller-rabin检查时，检查1时因为random接收的是0参数，会出错。所以，需要将1单独判断
(define (sum-primes a b)
    (define (prime? n)
        (if (= n 1)
            #t
            (fast-prime? n)))
    (filtered-accumulte-iter prime? + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b))

; b)计算小于n的所有与n互素的正整数的乘积------------------------------------
(define (product-coprimes n)
    (define (coprime? x)
        (and (< x n)
            (= 1 (gcd x n))))
    (filtered-accumulte-iter coprime? * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))