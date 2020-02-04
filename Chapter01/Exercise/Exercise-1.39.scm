; 正切函数(tanx)的连分式表示
; Ni=1时，为x，其余都为-x^2
; Di是相应位置的奇数
(load "./Exercise-1.37.scm")
(define (square x)
    (* x x))
(define (tan-cf x k)
    (define (N i)
        (if (= i 1)
            x
            (- (square x))))
    (define (D i)
        (- (* i 2) 1))
    (exact->inexact (cont-frac-iter N D k)))