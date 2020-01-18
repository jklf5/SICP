; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers
; 给出三个数，计算其中两个较大数的平方和
; 定义一个求两个数中较小值的过程
(define (min a b)
    (if (< a b)
        a
        b))
(define (square x)
    (* x x))
; 定义求解三数中较大数平方和的过程
(define (sum a b c)
    (- (+ (square a) (square b) (square c))
        (square (min (min a b) c))))