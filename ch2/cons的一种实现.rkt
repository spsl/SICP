#lang racket

;cons的一种实现，使用过程

(define (my-cons x y)
  (define (dispath m)
    (cond ((= m 0) x)
          ((= m 1) y)))
  dispath)

(define (my-car z)
  (z 0))
(define (my-cdr z)
  (z 1))

         
