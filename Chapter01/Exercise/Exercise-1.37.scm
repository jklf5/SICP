; 递归计算过程计算无穷连分式
(define (cont-frac N D k)
    (define (f i)
        (if (= i k)
            (/ (N k) (D k))
            (/ (N i) (+ (D i) (f (+ i 1))))))
    (f 1))
; 使用无穷连分式求黄金分割率的近似值（当Ni和Di都等于1时，无穷连分式产出结果为1/黄金分割率）
(define (golden-ratio k)
    (/ 1.0 
        (cont-frac (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))
; 当k大于12时，近似值具有十进制的4位精度
; 迭代计算过程版本
(define (cont-frac-iter N D k)
    (define (iter i result)
        (if (= i 1)
            result
            (iter (- i 1) (/ (N (- i 1)) (+ (D (- i 1)) result)))))
    (iter k (/ (N k) (D k))))