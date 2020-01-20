(load "Exercise-1.16.scm")
(define (expmod base exp m)
    (remainder (fast-expt base exp) m))

; 用Alyssa提出的这个方法计算base^exp % m时，是先计算base^exp，再用整体结果%m，这样做当base和exp很大的时候，会造成结果溢出，且运行时间会很慢。
; 而用以前的expmod方法，是求出局部base^exp后，立即计算%m，即使base和exp很大时，也不会造成溢出，且运行时间会更快。