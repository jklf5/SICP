; 使用牛顿法的特殊情况求平方根
; 如果x->g(x)是一个可微函数，那么方程g(x)=0（g(x)=y^2-x）的一个解就是函数x->f(x)的一个不动点，其中公式（1）：f(x)=x-g(x)/Dg(x)，其中Dg(x)是g(x)的导数
; 所以，可以通过不动点的方法，去逼近上述房产的解
(load "./Example-Finding fixed points of functions.scm")
(define dx 0.00001)
(define (square x)
    (* x x))
(define (average-damp f)
    (lambda (x) (average x (f x))))
; Dg(x)=(g(x+dx)-g(x))/dx，用该公式，当dx足够小时，可以求到g的导数在数值x时的值
(define (deriv g)
    (lambda (x) 
        (/ (- (g (+ x dx)) (g x))
            dx)))
; 写出公式（1）
(define (newton-transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))
; 将公式（1）应用于求不动点的过程中
(define (newton-method g guess)
    (fixed-point (newton-transform g) guess))
; 通过牛顿法找函数y->y^2-x的零点
(define (sqrt-newton-method x)
    (newton-method (lambda (y) (- (square y) x))
                    1.0))
; 用该方法求平方根，可以从任意点出发，迅速收敛到正确结果
; -------------------------------------------------------
; 定义更一般的求不动点过程，给出一个函数的过程g，一个变换g的过程，和一个猜测值，返回经过这一变换后的函数的不动点
(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))
; 将两种求不动点的方法写成更一般的方法：
; 搜寻y->x/y在平均阻尼下的不动点
(define (sqrt-average-damp-general x)
    (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))
; 用牛顿法搜寻y->y^2-x的牛顿变换的实例
(define (sqrt-newton-method-general x)
    (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))