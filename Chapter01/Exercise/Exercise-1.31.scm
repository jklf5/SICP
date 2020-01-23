; a)-----------------------------------------------------
; product：返回在给定范围中各点的某个函数值的乘积
; product的递归计算过程
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
            (product term (next a) next b))))
; 用product实现factorial(阶乘)，定义一个identity过程和inc过程；
; 最后调用(product identity a inc b)即可得到从a到b的阶乘
(define (identity x)
    x)
(define (inc x)
    (+ x 1))
; 计算π的近似值
; π = 4 × 2 × (4/3)^2 × (6/5)^2 × …… × (1/b+1)，精度更高
(define (pi-product b)
    (define (square x)
        (* x x))
    (define (pi-term x)
        (square (/ x (- x 1.0))))
    (define (pi-next x)
        (+ x 2))
    (* 4 (* 2 (product-iter pi-term 4 pi-next b) (/ 1.0 (+ b 1)))))
; b)-----------------------------------------------------
; product的迭代计算过程
(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

; 求π的近似值时，用product-iter的迭代计算过程代替product的递归计算过程，计算的层数更多。