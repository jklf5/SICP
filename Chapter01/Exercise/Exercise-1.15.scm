(define (cube x) (* x x x))
(define (p x)
    (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine(/ angle 3.0)))))
; 在求值(sine 12.15)的时候，p被使用了5次
; 在求值(sine a)的时候，a每次都被除以3.0，所以它的时间复杂度和空间复杂度都是O(loga)
; 也就是说，当运算规模扩大一倍时（即乘以3），p的运算次数会增加一次