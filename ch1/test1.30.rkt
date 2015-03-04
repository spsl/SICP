#lang slideshow
(define (sum term a next b)
  (define (sum-iter a result)
    (if (> a b)
        result
        (sum-iter (next a)
                  (+ (term a) result))))
  (sum-iter a 0))
