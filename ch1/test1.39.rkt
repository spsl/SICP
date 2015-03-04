#lang slideshow


;习题1.39

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
        x
        (* x x)))
  (define (D i)
    (- (* 2 i) 1))
  (define (iter i result)
    (let ((tmpresult (/ (N i)
                        (- (D i)
                           result))))
      (if (= i 1)
          tmpresult
          (iter (- i 1) 
                tmpresult))))
  (iter k 0))
            
