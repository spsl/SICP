#lang racket

;递归版本的append
(define (append x y)
  (if (null? x)
      y
      (cons (car x)(append (cdr x) y))))

(define (map item proc)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map (cdr item) proc))))



(define (finter predicate sequence)
  (cond ((null? sequence)'())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
      
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumerate-interval (+ low 1) high))))


(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (sum-odd-squares tree)
  (accumulate +
              0
              (map (filter odd? (enumerate-tree tree))
                   (lambda (x) (* x x)))))

(define tree (list 1 2 (list 3 (list 4 5) 6)))



(define (even-fib n)
  (accumulate cons
              '()
              (filter even?
                      (map (enumerate-interval 0 n)
                           (lambda (x) (* x x))))))
;获取奇数的平方的乘积           
(define (procdure-of-squares-of-odd-elements squares)
  (accumulate *
              1
              (map (filter odd? squares)
                   (lambda (x) (* x x)))))
   
   
   ;下面是2.33的习题

(define (map-new p squence)
  (accumulate (lambda (x y) 
                (cons (p x)
                      y))
              '()
              squence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (append-new seq1 seq2)
  (accumulate cons
              seq2
              seq1))

(define (length sequence)
  (accumulate (lambda (x y)
                (+ 1 y))
              0
              sequence))
   
   
   

              
   
   
   
   
   
   
   