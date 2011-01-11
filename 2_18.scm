(load "common.scm")


(define (reverse l)
  (define (reverse-iter l1 l2)
    (cond ((null? l1) l2)
	  (else
	   (reverse-iter (cdr l1) (cons (car l1) l2)))))
  (reverse-iter l '()))
    
(assert-equals (list 4 3 2 1) (reverse (list 1 2 3 4)))

