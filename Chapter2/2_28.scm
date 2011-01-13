(load "../common.scm")

(define (fringe l)
  (define (iterate source result)
    (cond ((null? source) result)
	  ((not (pair? source)) (cons source result))
	  (else
	   (append 
	    (iterate (car source) result)
	    (iterate (cdr source) result)))))
  (iterate l '()))


(define x (list (list 1 2) (list 3 4)))

(assert-equals '(1 2 3 4) (fringe x))
(assert-equals '(1 2 3 4 1 2 3 4) (fringe (list x x)))