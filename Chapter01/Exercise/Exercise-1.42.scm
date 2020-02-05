; 定义过程compose，实现将两个过程复合起来
(define (inc x)
    (+ x 1))
(define (square x)
    (* x x))
(define (compose f g)
    (lambda (x) (f (g x))))