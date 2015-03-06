#lang racket


(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))  ;叼

(define (cdr z)
  (z (lambda (p q) q)));ok!
