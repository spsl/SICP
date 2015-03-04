#lang slideshow
;f(a)<0 f(b) > 0
(define (search f a b)
  (let ((mid (avg a b)))
    (if (good-enough? a b)
        mid
        (let ((midvalue (f mid)))
          (cond ((>0? midvalue)
                 (search f a mid))
                ((<0? midvalue)
                 (search f mid b))
                (else mid))))))
(define (>0? n)
  (> n 0))
(define (<0? n)
  (< n 0))
(define (avg a b)
  (/ (+ a b) 2))

(define (good-enough? a b)
  (< (abs (- a b)) 0.000001))
(define (abs n)
  (if (< n 0)
      (- n) 
      n))
  
(define (f x)
  (- (* x 2) 25.9))

(define (search-filter f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (<0? a-value) (>0? b-value))
           (search f a b))
          ((and (<0? b-value) (>0? a-value))
           (search f b a))
          (else (error "ERROR a b "))))) 

(define (fixed-point f x)
  (let ((x-value (f x)))
    (if (good-enough? x-value x)
        x-value
        (fixed-point f (/ (+ x-value (f x)) 2)))))
           

              
