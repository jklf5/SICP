; 平滑一个函数
(load "../Exercise/Exercise-1.43.scm")
(define dx 0.00001)
(define (average-three x y z)
    (/ (+ x y z) 3))
(define (smooth f)
    (define dx 0.00001)
    (lambda (x)
        (average-three (f (- x dx)) (f x) (f (+ x dx)))))
; 结合repeated过程对smooth应用n次
(define (repeated-smooth f n)
    (lambda (x) 
        (((repeated smooth n) f) x)))

; 例子：
; ((repeated-smooth square 10) 5)