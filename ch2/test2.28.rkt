#lang racket

(define (reverse lst)
    (iter lst '()))

(define (iter remained-items result)
    (if (null? remained-items)
        result
        (iter (cdr remained-items)
              (cons (car remained-items) result))))

(define (fringe x)
  (define (iter tmp result)
    (cond ((null? tmp) '())
          ((not (pair? tmp)) 
           (cons tmp result))
          (else (begin
                  (iter (car tmp) result)
                  (iter (cdr tmp) result))))))