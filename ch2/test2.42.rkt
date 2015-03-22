#lang racket
(define (enumerate-interval begin end)
  (if (> begin end)
      '()
      (cons begin
            (enumerate-interval (+ begin 1) end))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pair n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-three n)
  (flatmap (lambda (i)
          (map (lambda (j)
                 (cons i j))
               (unique-pair (- i 1))))
        (enumerate-interval 1 n)))

(define (test-2-42 sum n)
  (filter (lambda (tmp) 
            (= sum
                (+ (car tmp)
                   (car (cdr tmp))
                   (car (cdr (cdr tmp))))))
          (unique-three n)))