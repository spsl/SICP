#lang slideshow
(define (filtered-accumulate combine null-value term a next b valid?);参照的参考答案
    (if (> a b)
        null-value
        (let ((rest-terms (filtered-accumulate combine
                                               null-value
                                               term
                                               (next a)
                                               next
                                               b
                                               valid?)))
            (if (valid? a)
                (combine (term a) rest-terms)
                rest-terms))))
;自己写一个迭代版本
(define (accumulate-filter combiner null-value term a next b valid?)
  (define (iter a result)
    (if (> a b)
        result
        (if (valid? a)
            (iter (next a)
                  (combiner (term a)
                            result))
            (iter (next a)
                  result))))
  (iter a null-value))

;测试:
(define (f x) x)
(define (inc x)(+ x 1))
(filtered-accumulate + 0 f 1 inc 10 even?)


(accumulate-filter + 0 f 1 inc 10 even?)