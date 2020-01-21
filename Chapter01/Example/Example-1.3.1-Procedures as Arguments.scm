; 用过程作为参数
; 定义sum过程为一个总的求和概念
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))
; 定义一个可以计算出逐渐收敛于π/8的数列的过程
(define (pi-sum a b)
    (define (pi-term x)
        (/ 1.0 (* x (+ x 2))))
    (define (pi-next x)
        (+ x 4))
    (sum pi-term a pi-next b))

; 将过程作为参数的好处在于可以写出一个表述求和的概念，而不是只能计算特定求和的过程。使得在编程时，可以去处理求和的概念本身，而不只是拘泥于某个特定求和