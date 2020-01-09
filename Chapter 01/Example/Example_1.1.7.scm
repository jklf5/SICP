; 采用牛顿法求平方根
; 1.MAKE A GUESS G
; 2.IMPROVE THE GUESS BY AVERAGING G AND X/G
; 3.KEEP IMPROVING THE GUESS UNTIL IT IS GOOD ENOUGH
; 4.USE 1 AS AN INITIAL GUESS

(define (square x)
    (* x x))

(define (average a b)
    (/ (+ a b) 2))

(define (abs x)
    (if (< x 0)
        (- x)
        x))

(define (sqrt x)
    (define (good-enough? guess)
        (< (abs (- (square guess) x))
            .0000001))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (try guess)
        (if (good-enough? guess)
            (/ guess 1.0)
            (try (improve guess))))
    (try 1))