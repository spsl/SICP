#lang slideshow

(define (memq word words)
  (cond ((null? words) #f)
        ((eq? word (car words)) words)
        (else (memq word (cdr words)))))
         

(define x '(x (apple sacue) y apple pear))