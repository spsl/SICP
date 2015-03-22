#lang racket

(define (equal?? x y)
  (if (and (list? x)
           (list? y)
           (not (null? x))
           (not (null? y)))
      (and (equal?? (car x)
                    (car y))
           (equal?? (cdr x)
                    (cdr y)))
      (eq? x y)))