#lang racket
(define (get item n)
  (define (iter i tmp)
    (if (= i n)
        (car tmp)
        (iter (+ i 1)
              (cdr tmp))))
  (let ((tmp-length (length item)))
    (if (or (> n tmp-length)(= n tmp-length))
        (error "index out!!")
        (iter 0 item))))

(define (length item)
  (define (iter i tmp-item)
    (if (null? tmp-item)
        i
        (iter (+ i 1)
              (cdr tmp-item))))
  (iter 0 item))

(define (last-pair x)
  (list (get x (- (length x) 1)))) 