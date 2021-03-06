; 通过区间折半寻找方程的根（零点定理）
(define (abs x)
    (if (< x 0)
        (- x)
        x))

(define (positive? x)
    (cond ((> x 0) #t)
        (else #f)))

(define (negative? x)
    (cond ((< x 0) #t)
        (else #f)))

(define (average x y)
    (/ (+ x y) 2))
; 每次取一个f(a)<0<f(b)的区间，直到在可以容忍的误差范围内
(define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
            midpoint
            (let ((test-value (f midpoint)))
                (cond ((positive? test-value)
                        (search f neg-point midpoint))
                    ((negative? test-value)
                        (search f midpoint pos-point))
                    (else midpoint))))))
; 设定一个可以容忍的误差
(define (close-enough? x y)
    (< (abs (- x y)) 0.001))
; 给定需要求解的函数和初始a，b点，并判断f(a),f(b)是否同号
(define (half-interval-method f a b)
    (let ((a-value (f a))
        (b-value (f b)))
        (cond ((and (negative? a-value) (positive? b-value))
                (search f a b))
            ((and (negative? b-value) (positive? a-value))
                (search f b a))
            (else (error "Values are not of opposite sign" a b)))))