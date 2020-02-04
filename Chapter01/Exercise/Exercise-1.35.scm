(load "../Example/Example-Finding fixed points of functions.scm")
; 通过黄金分割率是变换x->1+1/x的不动点，计算黄金分割率
(define golden-ratio
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))