; 定义一个有一个过程作为参数的过程double，它返回一个将f应用两次的过程
(define (double f)
    (lambda (x) (f (f x))))
(define (inc x)
    (+ x 1))
; (((double (double double)) inc) 5) = 21