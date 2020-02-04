(load "../Example/Example-Finding fixed points of functions.scm")
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (newline)
        (display guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                (begin 
                    (newline)
                    (display next)
                    next)
                (try next))))
    (try first-guess))
(define f
    (lambda (x) (/ (log 1000) (log x))))
; 平均阻尼技术
(define (average-damp f)
    (lambda (x) (average x (f x))))
; 总结：
; 不使用阻尼技术的时候需要35步，使用阻尼技术的时候只需要10步。