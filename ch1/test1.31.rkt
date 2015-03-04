#lang slideshow
;定义product 迭代版本
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a)
                 result))))
  (iter a 1))

;使用product定义factorial
(define (factorial n)
  (define (f x)x)
  (define (inc x) (+ 1 x))
  (product f 1  inc n))


;分子的处理
(define (fenzi-number x)
  (if (even? x)
      (+ x 2)
      (+ x 1)))
;分母的处理
(define (fenmu-number x)
  (if (odd? x)
      (+ x 2)
      (+ x 1)))
;自增
(define (inc x)(+ x 1))

(define (pai n)  
  (* 4
     ( exact->inexact
       (/ (product fenzi-number 1 inc n)
        (product fenmu-number 1 inc n)))))

(define (product-digui term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-digui term (next a) next b))))

