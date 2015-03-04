#lang slideshow 

;习题1.32

(define (accumulate combiner null-value term a next b);递归版本
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (f x) x)
(define (inc x)(+ x 1))

;迭代版本
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner (term a) result))))
  (iter a null-value))

;使用acumulate-iter定义sum
(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

;使用accumulate-iter定义product
(define (product term a next b)
  (accumulate-iter * 1 term a next b))