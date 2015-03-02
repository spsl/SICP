#lang slideshow



(define (sqrt-3 x)
  (define (improve guess)
    (/ (+ (/ x (* guess guess)) 
        (* 2 guess))
       3))
  (define (sqrt-lite-3 guess)
    (if (good-enough? guess (improve guess))
        guess
        (sqrt-lite-3 (improve guess)
                     )))
  (define (good-enough? old-guess new-guess)
    (< (/ (abs (- new-guess old-guess))
          old-guess)
       0.000000000001))
  
  (sqrt-lite-3 1.0))

