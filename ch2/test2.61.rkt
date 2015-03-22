#lang racket


(define (adjoin-set x set)
  (cond ((null? set)
         (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
         


(define set (list 1 2 3 4 5 6 8 9))
