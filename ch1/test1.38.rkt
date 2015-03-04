#lang slideshow

(define (n i) 1.0)
(define (d i) 1.0)

(define (N i) 1.0)
(define (D i)
  (cond ((or (= (remainder i 3) 1)
             (= (remainder i 3) 0))
         1.0)
        (else (* 2.0
                 (div (+ i 1)
                      3)))))
   
 ;重新定义x/y ，因为drracket中除法不是我想要的
(define (div x y)
  (/ (- x (remainder x y))
     y))

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

(define (e n)
  (+ 2 (cont-frac-iter N D n)))
