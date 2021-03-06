#lang slideshow
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (factorial-2 n)
  (define (mult count proc)
    (if (> count n)
        proc
        (mult(+ count 1) (* count proc))
        ))
  (mult 1 1))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(define (a x y)
  (A x y))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib-2 n)  
  (define (fib-lite count x y)
    (if (> count n) 
        y
        (fib-lite (+ count 1)
                  y 
                  (+ x y))))
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (fib-lite 2 0 1))))
                  



