; 给出三个数，计算其中两个较大数的和
; 定义一个求两个数中较小值的过程
(define (min a b)
    (if (< a b)
        a
        b))
; 定义求解三数中较大数和的过程
(define (sum a b c)
    (- (+ a b c)
        (min (min a b) c)
    ))