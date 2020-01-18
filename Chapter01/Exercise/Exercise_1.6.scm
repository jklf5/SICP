(define (square x)
    (* x x))

(define (average a b)
    (/ (+ a b) 2))

(define (abs x)
    (if (< x 0)
        (- x)
        x))

(define (good-enough? guess x)
        (< (abs (- (square guess) x))
            .0000001))

(define (improve guess x)
        (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                        x)))

; 这个过程会出问题是由于if和new-if的不同导致的。
; 由P12页可知，if是条件表达式的一种受限形式，适用于分情况分析中只有两个情况的需要。当它的 predicate 部分为真时， then-clause 分支会被求值，否则的话， else-clause 分支被求值，两个 clause 只有一个会被求值。
; 新定义的 new-if 只是一个普通函数，它没有 if 所具有的特殊形式，根据解释器所使用的应用序求值规则，每个函数的实际参数在传入的时候都会被求值，因此，当使用 new-if 函数时，无论 predicate 是真还是假， then-clause 和 else-clause 两个分支都会被求值。
; 可以使用如下测试：
; (if #t (display "good") (display "bad"))
; (new-if #t (display "good") (display "bad"))
; 因为无论测试结果如何， 带有new-if的sqrt-iter 都会一直递归下去。