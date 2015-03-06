#lang racket

;习题2.2

;打印点
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;定义point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


 ;定义线段
(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))


;求线段的终点
(define (mid-point segment)
  (let ((mid (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment))))))
    (print-point mid)))

                     
(define (average a b)
  (/ (+ a b) 2.0))


(define start (make-point 1 3))

(define end (make-point 12 7))

(define segment (make-segment start end))






         