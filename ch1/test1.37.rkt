#lang slideshow

(define (n i) 1.0)
(define (d i) 1.0)

(define (cont-frac n d k);嗯 先写一个递归版本的
  (define (try i )
    (if (> i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i)
              (try (+ i 1))))))
  (try 1))
        
(define (cont-frac-iter n d k);迭代版本
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i)
                    result)))))
  (iter (+ k 1) 0))


(define (huangjin x)
  (/ 1 (cont-frac-iter n d x)))