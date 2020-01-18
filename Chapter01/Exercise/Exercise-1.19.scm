(define (even? n)
    (= (remainder n 2) 0))

(define (square x) (* x x))


; 对于对偶(a,b)，有变换T(pq)为a <- bq+a(p+q)，b <- bp+aq.
; 对于T(pq)^2，有a <- (bp+aq)q+(bq+a(p+q))(p+q)=b(2pq+q^2)+a(p^2+q^2+2pq+q^2)， b <- (bp+aq)p+(bq+a(p+q))q=b(p^2+q^2)+a(2pq+q^2).
; 所以，p' = p^2+q^2，q' = 2pq+q^2
(define (fib-iter a b p q count)
    (cond ((= count 0) b)
        ((even? count) (fib-iter a
                                b
                                (+ (square p) (square q))
                                (+ (* 2 p q ) (square q))
                                (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (fib n)
    (fib-iter 1 0 0 1 n))