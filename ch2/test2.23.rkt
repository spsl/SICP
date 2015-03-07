#lang racket


;只执行，不返回任何只
(define (for-each items proc)
  (define (iter things)
    (cond ((not (null? things))
             (proc (car things))
             (iter (cdr things)))))
  (iter items))

;下面是扩展的js版本

;js对数组的迭代有以下几种方式
; 1) every();对每一项运行给定函数，如果都为true，则为true，否则false
; 2) filter(); 对返回由true组成的新数组
; 3) forEach(); 对每个都运行，没有返回值（已经实现）
; 4) map() 对数组中的每一项运行给定函数，返回每次调用之后的新数组（已经实现）
; 5) some() 对每一项运行函数，如果有一个返回true，则返回true

; map()
(define (map item proc)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map proc (cdr item)))))

;every()
(define (every items proc)
  (define (iter things result)
    (if (null? things)
        result
        (iter (cdr things)
              (and (proc (car things))
                   result))))
  (iter items #t))

;soma() 和every几乎一模一样
(define (some items proc)
  (define (iter things result)
    (if (null? things)
        result
        (iter (cdr things)
              (or (proc (car things))
                  result))))
  (iter items #f))

;filter()
(define (filter items proc)
  (cond ((null? items) '() )
        ((proc (car items))
         (cons (car items)
               (filter (cdr items) proc)))
        (else (filter (cdr items) proc))))
 









