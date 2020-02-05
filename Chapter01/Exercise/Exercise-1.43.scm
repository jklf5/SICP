; 定义一个使f重复n次应用的过程--repeated
(load "../Exercise/Exercise-1.42.scm")
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))