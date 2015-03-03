#lang slideshow

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))


(define (multi a b)
  (define (multi-iter a b c)
    (cond ((= b 0) c)
          ((even? b)
           (multi-iter (double a)
                  (halve b)
                  c))
          ((odd? b)
           (multi-iter a
                  (- b 1)
                  (+ a c)))))
  (multi-iter a b 0))
            
            
            
            
            
            
            
            
