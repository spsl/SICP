#lang racket

(define (cons x y)
  (* (N 2 x)
     (N 3 y)))

(define (N m n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (+ i 1)
              (* m result))))
  (iter 1 1)) 

(define (car x)
  (define (iter i tmp)
    (if (= (remainder tmp 2) 0)
        (iter (+ i 1) (/ tmp 2))
        i))
  (iter 0 x))

(define (cdr x)
  (define (iter i tmp)
    (if (= (remainder tmp 3) 0)
        (iter (+ i 1) (/ tmp 3))
        i))
  (iter 0 x))
        