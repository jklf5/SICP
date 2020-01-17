(define (double x)
    (* 2 x))

(define (halve x)
    (/ x 2))

(define (even? n)
    (= (remainder n 2) 0))

(define (fast-mcl a b)
    (cond ((= b 0) b)
        ((even? b) (double (fast-mcl a (halve b))))
        (else (+ a (fast-mcl a (- b 1))))))