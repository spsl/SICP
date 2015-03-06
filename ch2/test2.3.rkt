#lang racket


;习题2.3,考虑到因为如果按照常规的定义一个矩形的话，会需要很多的点，故，只定义矩形的对角线的线段，以此来表示一个矩形。

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

;定义一个矩形，接受两个点，作为这个矩形的对角线
(define (make-rect x y)
  (make-segment x y))

(define (rect-culument-s rect)
  (* (rect-get-width rect)
     (rect-get-height rect)))

(define (rect-culument-c rect)
  (* 2
     (+ (rect-get-width rect)
        (rect-get-height rect))))

 (define (rect-get-width rect)
   (abs (- (x-point (start-segment rect))
           (x-point (end-segment rect)))))

(define (rect-get-height rect)
  (abs (- (y-point (start-segment rect))
          (y-point (end-segment rect)))))
  
 
;使用另外一种定义，接受两个参数，表示这个矩形的宽和高（因为反正用不到位置信息）

(define (new-make-rect width height)
  (cons width height))

(define (new-rect-get-width rect)
  (car rect))

(define (new-rect-get-height rect)
  (cdr rect))


  (define (new-rect-culument-s rect)
  (* (new-rect-get-width rect)
     (new-rect-get-height rect)))

(define (new-rect-culument-c rect)
  (* 2
     (+ (new-rect-get-width rect)
        (new-rect-get-height rect))))
  
  
  
  
  
  
  