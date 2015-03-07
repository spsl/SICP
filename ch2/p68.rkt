#lang racket
(define nil -1)

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


;递归版本的append
(define (append x y)
  (if (null? x)
      y
      (cons (car x)(append (cdr x) y))))


;迭代版本append，效率太低
(define (append-2 x y)
  (define (iter i result)
      (if (< i 0)
          result
          (iter (- i 1)
                (cons (get x i) result))))
  (iter (- (length x) 1) y))