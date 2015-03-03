#lang slideshow
(define (fast-expt-2 b n)
  (define (expt-lite b n a)
    (cond ((= n 0) a)
          ((even? n)
           (expt-lite (* b b)
                      (/ n 2)
                      a))
          ((odd? n)
           (expt-lite b
                      (- n 1)
                      (* a b)))))
  (expt-lite b n 1))


