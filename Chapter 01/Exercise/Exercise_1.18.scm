; 结合1.16与1.17，在计算两个数的乘积时，用加法且为对数阶增长的迭代计算过程
(define (double x)
    (* 2 x))

(define (halve x)
    (/ x 2))

(define (even? n)
    (= (remainder n 2) 0))

(define (fast-mcl a b)
    (fast-mcl-iter a b 0))

(define (fast-mcl-iter a b x)
    (cond ((= b 0) x)
        ((even? b) (fast-mcl-iter (double a) (halve b) x))
        (else (fast-mcl-iter a (- b 1) (+ a x)))))