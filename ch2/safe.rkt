#lang racket

(define (enumerate-interval begin end)
  (if (> begin end)
      '()
      (cons begin
            (enumerate-interval (+ begin 1) end))))

(define (safe? position)
  (define (iter x n tmp)
    (cond ((null? tmp)
           #f)
          (else (not (or (= x (car tmp))
                         (= n (abs (- x (car tmp))))
                         (iter x (+ x 1)(cdr tmp)))))))
  (iter (car position) 1 (cdr position)))

(define (adjoin new-row tmpresult)
  (map (lambda (position)
         (if (not (pair? position))
             (list new-row position)
             (cons new-row position)))
       tmpresult))

(define (ttt tmpresult)
  (filter (lambda (x) (safe? x))
          (filter (lambda (hh) #t) 
           (map (lambda (i)
                 (adjoin i tmpresult))
               (enumerate-interval 1 8)))))
               
 (define (ttt-2 tmpresult)
    (map (lambda (i)
                 (adjoin i tmpresult))
               (enumerate-interval 1 8)))
               
               
               