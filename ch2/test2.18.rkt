#lang racket
;迭代版本
(define (reverse x)
  (define (iter h k)
    (if (null? h)
        k
        (iter (cdr h)(cons (car h) k))))
  (iter (cdr x)(list(car x))))

;迭代版本


