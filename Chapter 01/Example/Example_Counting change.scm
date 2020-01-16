; 采用递归过程，假定我们考虑的可用硬币类型种类排了某种顺序，于是就有下面的关系：
; 将总数为a的现金换成n种硬币的不同方式的数目等于
;   将现金数a换成除第一种硬币之外的所有其他硬币的不同方式数目，加上
;   将现金a-d换成所有种类的硬币的不同方式数目，其中的d是第一种硬币的币值
; 这样就可以将某个给定现金数的换零钱方式的问题，递归的归约为对更少现金数或者更少种类硬币的同一个问题，仔细考虑上面的归约规则，设法使你确信，如果采用下面方式处理退化情况，我们就能利用上面规则写出一个算法来：
;   如果a就是0，应该算作是有1种换零钱的方式
;   如果a小于0，应该算作是有0种换零钱的方式
;   如果n是0，应该算作是有0种换零钱的方式
(define (count-change amount)
    (cc amount 5))

(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
            ((or (< amount 0) (= kinds-of-coins 0)) 0)
            (else (+ (cc amount
                        (- kinds-of-coins 1))
                    (cc (- amount
                            (first-denomination kinds-of-coins))
                        kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
            ((= kinds-of-coins 2) 5)
            ((= kinds-of-coins 3) 10)
            ((= kinds-of-coins 4) 25)
            ((= kinds-of-coins 5) 50)))