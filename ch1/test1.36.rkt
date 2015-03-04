#lang slideshow
;习题1.36

(define GOOD-ENOUGH 0.000001)

(define (fixed-point f step x);平均阻尼
  (print-step step x)
  (let ((x-value (f x)))
    (if (good-enough? x-value x)
        (begin (print-step (+ step 1) x-value)
         x-value
         )
        (fixed-point f (+ step 1)(/ (+ x-value  x) 2)))))


(define (fixed-point-2 f step x);非平均阻尼
  (print-step step x)
  (let ((x-value (f x)))
    (if (good-enough? x-value x)
        (begin
          (print-step (+ step 1)
                      x-value)
          x-value)
        (fixed-point f (+ step 1) x-value))))


(define (good-enough? a b )
  (< (abs (- a b)) GOOD-ENOUGH))

(define (f-test x)
  (- (* x 2) 10))


(define (print-step step n)
  (display "step: ")
  (display step)
  (display "  ")
  (display "n= ")
  (display n)
  (newline))



;下面是别人的答案
(define tolerance 0.000001)

(define (fixed-point-3 f first-guess)
                
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))

    (define (try guess step)
        (display-info guess step)                       ; 每次进入测试时打印一次猜测
        (let ((next (f guess)))
            (if (close-enough? next guess)
                (begin                                  ; 如果猜测完成
                    (display-info next (+ 1 step))      ; 记得算上最后一次计算 next 的猜测
                    next)
                (try next (+ 1 step)))))

    (try first-guess 1))

(define (display-info guess step)
    (display "Step: ")
    (display step)
    (display " ")
    
    (display "Guess: ")
    (display guess)
    (newline))




(define formula 
    (lambda (x)
        (/ (log 1000) 
           (log x))))

