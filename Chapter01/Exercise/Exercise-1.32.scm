; combine:（过程）描述如何将当前项与前面各项的积累结果组合起来
; null-value:描述在所有的项都用完时的基本值
; a)-----------------------------------------------------
; accumulate的递归计算过程
(define (accumulate combine null-value term a next b)
    (if (> a b)
        null-value
        (combine (term a)
                (accumulate combine null-value term (next a) next b))))
; 重写sum过程
(define (sum term a next b)
    (define (combine x y)
        (+ x y))
    (accumulate combine 0 term a next b))
; 重写product过程
(define (product term a next b)
    (define (combine x y)
        (* x y))
    (accumulate combine 1 term a next b))
; b)-----------------------------------------------------
; accumulate的迭代计算过程
(define (accumulate-iter combine null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combine result (term a)))))
    (iter a null-value))
