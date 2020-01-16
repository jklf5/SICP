; 递归计算过程
(define (recurve n)
    (cond ((< n 3) n)
        (else (+ (recurve (- n 1))
                    (* 2 (recurve (- n 2)))
                    (* 3 (recurve (- n 3)))))))

; 迭代计算过程
; 每次将：
; a <- a+2b+3c
; b <- a
; c <- b
(define (iterate n)
    (define (temp a b c counter)
        (if (= counter 0)
            c
            (temp (+ a (* 2 b) (* 3 c)) a b (- counter 1))))
    (temp 2 1 0 n))

; 递归计算过程是从上往下，递归计算过程会有很多重复多余计算
; 迭代计算过程是从下往上