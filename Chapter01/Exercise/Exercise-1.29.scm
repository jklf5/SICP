; 求解x^3的定积分
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))
(define (cube x)
    (* x x x))
(define (even? n)
    (= (remainder n 2) 0))
; 法一-----------------------------------------------------
(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
        dx))
; 法二：辛普森规则-----------------------------------------------
(define (simpson-rule f a b n)
    (define h (/ (- b a) n)) ; 计算h
    (define (coefficient k) ; 根据k计算系数
        (cond ((= k 0) 1)
            ((= k n) 1)
            ((even? k) 2)
            (else 4)))
    (define (next k) ; 用于计算下一个表达式
        (+ k 1))
    (define (y k) ; y=f(a+kh)
        (f (+ a (* k h))))
    (define (term k)
        (* (coefficient k) (y k)))
    (* (sum term 0 next n) (/ h 3.0)))

; 结论，simpson-rule相较于integral，精度更高