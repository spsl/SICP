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



(define dx 0.001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (+ x dx))
          (f  x)
          (f (- x dx)))
       3.0)))

(define (smooth-repeated f n)
  (repeated (smooth f) n))
