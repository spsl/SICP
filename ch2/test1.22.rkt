#lang racket
(define (reverse x)
  (define (iter h k)
    (if (null? h)
        k
        (iter (cdr h)(cons (car h) k))))
  (iter (cdr x)(list(car x))))

(define (** x)
  (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (** (car things))))))
  (iter items '()))

(define (square-list-iter items)
  (define (iter things result)
    (if (null? things)
        (reverse result)
        (iter (cdr things) 
              (cons (** (car things))
                    result))))
  (iter items '()))