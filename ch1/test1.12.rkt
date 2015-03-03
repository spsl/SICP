#lang slideshow
(define (pasical x y)
  (cond ((= y 1) 1)
        ((= x y) 1)
        (else (+ (pasical (- x 1)(- y 1))
                 (pasical (- x 1) y)))))
