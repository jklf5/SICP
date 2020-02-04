; 欧拉的展开式主要是Di的值变换
; 观察到：当(i+1)%3=0时，Di=(i+1)/3*2，其余时候，Di=1
(load "./Exercise-1.37.scm")
(define (calculate-e k)
    (define (D i)
        (if (= 0 (remainder (+ i 1) 3))
            (* 2 (/ (+ i 1) 3))
            1))
    (+ 2.0 (cont-frac (lambda (i) 1.0)
                    D
                    k)))