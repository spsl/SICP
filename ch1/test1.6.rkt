#lang slideshow
(define (sqrt-lite guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-lite (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.0000000000001))
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (sqrt x)
  (sqrt-lite 1.0 x))

(define (square x)
  (* x x))

(define (new-if a b c)
  (cond (a b)
        (else c)))
#ok 懂了，因为采用正则序，所以，在使用new-if的时候，会把所有的a b c 都需要执行一遍，因此就造成无限递归



