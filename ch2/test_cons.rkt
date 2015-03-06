#lang slideshow

(define x (cons 1 2))

(define y (cons 3 4))

(define z (cons x y))

(define (add-rat x y)
  (make-rat (+ (* (numer x)
              (denom y))
           (* (numer y)
              (denom x)))
        (* (denom x)(denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x)
                  (denom y))
               (* (numer y)
                  (denom x)))
            (* (denom x)
               (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x)
               (numer y))
            (* (denom x)
               (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x)
               (denom y))
            (* (numer y)
               (denom y))))

(define (equal-rat x y)
  (= (* (numer x)
        (denom y))
     (* (numer y)
        (numer x))))
               
(define (make-rat n d)
  (cons n d))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))