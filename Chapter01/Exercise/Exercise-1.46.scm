(load "../Example/Example-1.1.7-Square Roots by Newton’s Method.scm")
(load "../Example/Example-Finding fixed points of functions.scm")
(define tolerance 0.00001)
(define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
; 定义iterative-improve过程，iterative-improve过程和之前的fixed-point过程很像
(define (iterative-improve close-enough? improve)
    (lambda (first-guess) 
        (define (try guess)
            (let ((next (improve guess)))
                (if (close-enough? guess next)
                    next
                    (try next))))
        (try first-guess)))
; 重定义fixed-point过程
(define (fixed-point f first-guess)
    (define (improve guess)
        (f guess))
    ((iterative-improve close-enough? improve) first-guess))
; 重定义sqrt过程
(define (sqrt x)
    (define (improve guess)
        (average guess (/ x guess)))
    ((iterative-improve close-enough? improve) 1.0))