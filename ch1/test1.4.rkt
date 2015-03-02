#lang slideshow
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
#如果b>0 则a + b 否则 a-b 即a+|b|

