; Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.(使用递归计算过程计算出帕斯卡三角形的各个元素)
; 从0 0开始计数
(define (Pascal row column)
    (cond ((> column row) (display "unvalid col value"))
        ((or (= column 0) (= row column)) 1)
        (else (+ (Pascal (- row 1) (- column 1)) (Pascal (- row 1) column)))))