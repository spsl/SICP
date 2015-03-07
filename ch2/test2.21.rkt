#lang racket

(define (square x)(* x x))
(define (square-list y)
  (if (null? y)
      '()
      (cons (square (car y))
            (square-list (cdr y)))))

(define (map proc item)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map proc (cdr item)))))

(define (square-list-2 y)
  (map (lambda (x) (* x x)) y))