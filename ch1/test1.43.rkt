#lang slideshow
(define (repeated f n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (+ i 1)
              (f result))))
  (lambda (x)
    (iter 1 x)))

(define (inc x)(+ x 1))
    
(define (square x)
  (* x x))

(define (repeated-2 f n)
  (define (iter i f-lambda)
    (if (= i n)
        f-lambda
        (iter (+ i 1)
              (lambda (x) (f (f-lambda x))))))
  (iter 1 f))
          