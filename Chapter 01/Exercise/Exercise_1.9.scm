(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec  a) b))))
; (plus 4 5)
; (inc (plus 3 5))
; (inc (inc (plus 2 5)))
; (inc (inc (inc (plus 1 5))))
; (inc (inc (inc (inc (plus 0 5)))))
; (inc (inc (inc (inc 5)))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
; 综上，这是一个线性递归的过程

; 另一个
(define (+ a b)
    (if (= a 0)
        b
        (+ (dec a) (inc b))))
; (plus 4 5)
; (plus 3 6)
; (plus 2 7)
; (plus 1 8)
; (plus 0 9)
; 9
; 综上，这是一个线性迭代的过程
