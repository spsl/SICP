#lang racket

(define (scala-list item factory)
  (if (null? item)
      '()
      (cons (* factory (car item))
            (scala-list (cdr item) factory))))

(define (map proc item)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map proc (cdr item)))))

(define (new-scala-list item factory)
  (map (lambda (x) (* x factory)) item))
