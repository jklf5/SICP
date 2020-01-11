; Example_1.1.7中的求平方根方法对于小的数字如：(sqrt 0.00009)，以及大的数字如：(sqrt 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)，都不能得到准确结果
; 用题目中提到的方法，对于good-enough?不再比较差，而是比较新旧两个guess值的变化比例，当变化比例很小时，就可以得到准确结果。
(define (square x)
    (* x x))

(define (average a b)
    (/ (+ a b) 2))

(define (abs x)
    (if (< x 0)
        (- x)
        x))

; (improve guess x)即为new-guess，guess为old-guess
; 用new-guess减去old-guess，得到这一次迭代到下一次迭代的变化值，再除以old-guess，即为所求变化率，当变化率小于0.1时，得到准确结果
(define (good-enough? guess x)
        (< (/ (abs (- (improve guess x) guess)) guess)
            0.001))

(define (improve guess x)
        (average guess (/ x guess)))

(define (sqrt x)
    (define (try guess)
        (if (good-enough? guess x)
            guess
            (try (improve guess x))))
    (try 1.0))