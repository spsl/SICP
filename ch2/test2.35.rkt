#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map item proc)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map (cdr item) proc))))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate (lambda (x y)
                (+ y 1))
              0
              (map (enumerate-tree t)
                   (lambda (x) x))))

(define tree (list (list 1 2 ) 3))