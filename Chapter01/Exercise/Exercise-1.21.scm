(define (square x) (* x x))

(define (divides? a b)
    (= (remainder b a) 0))

(define (smallest-divisor n)
    (find-divisor n 2))
; find-divisor过程可以找出当n不是素数时,n的最小因子
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
; 找到n的最小因子
(define (find-smallest n)
    (smallest-divisor n))

; (find-smallest 199) = 199
; (find-smallest 1999) = 1999
; (find-smallest 19999) = 7