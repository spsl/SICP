#lang racket

(define (union-set x1 x2)
  (cond ((null? x1) x2)
        ((null? x2) x1)
        ((= (car x1)
            (car x2))
         (cons (car x1)
               (union-set (cdr x1) (cdr x2))))
        ((< (car x1) (car x2))
         (cons (car x1)
               (union-set (cdr x1) x2)))
        ((> (car x1) (car x2))
         (cons (car x2)
               (union-set x1 (cdr x2))))))

(define x1 (list 1 2 3 4 5 8 9 10 32 ))


(define x2 (list 2 3 4 5 6 54 76 ))


(union-set x1 x2)
