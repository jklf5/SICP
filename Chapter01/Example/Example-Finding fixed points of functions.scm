(define (average x y)
    (/ (+ x y) 2))
; 找出函数的不动点
(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))
; 将平方根的计算形式化为一个寻找不动点的计算过程。计算某个数x的平方根，就是要找到一个y使得y^2=x，变形为：y=x/y。
; 另外，可以用平均阻尼技术，来帮助在不动点搜寻中收敛的手段。
; 所以，为了帮助不动点收敛，取y之后的下一个猜测值为：(1/2)(y+x/y)而不是(x/y)，也就是搜寻y->(1/2)(y+x/y)的不动点
(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y))) 1.0))