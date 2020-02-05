(load "../Exercise/Exercise-1.43.scm")
(load "../Example/Example-1.3.4-Procedures as Returned Values.scm")
(load "../Exercise/Exercise-1.16.scm") ; 求幂过程
; 通过实验发现，计算n次方根时，需要lg(n)向下取整次平均阻尼
(define (lg n)
    (cond ((> (/ n 2) 1) (+ 1 (lg (/ n 2))))
        ((< (/ n 2) 1) 0)
        (else 1)))
; 结合repeated和lg过程根据n进行多次平均阻尼
(define (repeated-average-damp f n)
    ((repeated average-damp n) f))
; 结合fixed-point，repeated-average-damp过程以及fast-expt过程求x的n次方根
(define (calculate-n-roots x n)
    (define (temp x)
        (repeated-average-damp (lambda (y) (/ x (fast-expt y (- n 1)))) (lg n)))
    (fixed-point (temp x) 1.0))