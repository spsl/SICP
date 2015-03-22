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

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op 
                        init
                        (map seqs car))
            (accumulate-n op init (map seqs cdr)))))

(define ss (list (list 1 2 3 4) (list 5 6 7 8)(list 9 10 11 12)))

            
                       
            