#lang rackET

(define (append x y)
  (if (null? x)
      y
      (cons (car x)
            (append (cdr x) y))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map proc item)
  (if (null? item)
      '()
      (cons (proc (car item))
            (map proc (cdr item)))))

(define (enumerate-interval begin end)
  (if (> begin end)
      '()
      (cons begin
            (enumerate-interval (+ begin 1) end))))
   
   
   
;--------------------------------------------------------------

(define n 7)
(accumulate append
            '()
            (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))


(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))



(accumulate append '()
            (map (lambda (i)
       (map (lambda (j)
              (map (lambda (k) (list i j k))
                   (enumerate-interval 1 (- j 1))))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 (- n 1))))

(define (unique-pair n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
(define (unique-three n)
  (flatmap (lambda (i)
          (map (lambda (j)
                 (cons i j))
               (unique-pair (- i 1))))
        (enumerate-interval 1 n)))

(define (equals-sum? tmp)
  (= sum
     (+ (car tmp)
        (car (cdr tmp))
        (car (cdr (cdr tmp))))))
            
(define (test-2-42 sum n)
  (filter equals-sum? (unique-three n)))
