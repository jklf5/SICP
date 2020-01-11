; 使用所给公式编写求立方根的牛顿法代码
; 使用Exercise_1.7中对于good-enough?的改进
(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) guess)) guess)
        0.001))

(define (improve guess x)
    (average guess (/ (+ (/ x (* guess guess)) (* 2.0 guess)) 3.0)))

(define (average x y)
    (/ (+ x y) 2.0))

(define (abs x)
    (if (< x 0)
        (- x)
        x))

(define (cbrt x)
    (define (try guess)
        (if (good-enough? guess x)
            guess
            (try (improve guess x))))
    (try 1.0))