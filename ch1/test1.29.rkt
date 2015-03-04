#lang slideshow

   
   
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (+ (term a) result))))
  (iter a 0))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (next i)(+ i 1))
  (define (y k)
    (cond ((or (= k 0) (= k n))
           (* 1 (f (+ a (* k h)))))
          ((even? k)
           (* 2 (f (+ a (* k h)))))
          ((odd? k)
           (* 4(f (+ a (* k h)))))))
           
           
  (* (/ h 3)(sum y 0 next n))) 


