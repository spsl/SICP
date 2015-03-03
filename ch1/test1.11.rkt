#lang slideshow
(define (f n)
  (cond((< n 3) n)
       (else (+ (f(- n 1)) 
                (* 2 (f (- n 2)))
                (* 3 (f (- n 3)))
                ))))

(define (f2 n)
  (define (ff a b c i n)
    (if (= i n)
        a
        (ff b
            c
            (+ c (* 2 b ) (* 3 a))
            (+ i 1)
            n)))
  (ff 0 1 2 0 n))

(define (f3 n)
    (f-iter 2 1 0 0 n))

(define (f-iter a b c i n)
    (if (= i n)
        c
        (f-iter (+ a (* 2 b) (* 3 c))   ; new a
                a                       ; new b
                b                       ; new c
                (+ i 1)
                n)))
         
            
