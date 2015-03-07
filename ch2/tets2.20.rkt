#lang racket

(define (append seq x)
    (if (null? seq)
        (list x)
        (cons (car seq)
              (append (cdr seq) x))))
   
   
 ;迭代版本  
(define (same-parity-iter x . y)
  (let ((tmp (list x))
        (K (remainder x 2)))
    (define (iter z result)
      (if (null? z)
          result
          (iter (cdr z)
                (if (= (remainder (car z) 2)K)
                    (append result (car z))
                    result))))
    (iter y tmp)))

;递归版本
(define (same-parity x . y)
  (let ((like? (if (even? x)
                   even?
                   odd?)))
    (define (filter z)
      (if (null? z)
          '()
          (if (like? (car z))
              (cons (car z)
                    (filter (cdr z)))
              (filter (cdr z)))))
    (cons x (filter y))))
