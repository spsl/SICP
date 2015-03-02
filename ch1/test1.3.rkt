#lang slideshow
(define (get_max a b c)
  (cond ((and (> a b) (> a c)) a)
        ((and (> b c) (> b a)) b)
        (else c)))
