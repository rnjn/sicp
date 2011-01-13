(load "common.scm")

(define (accumulate f initial sequence)
  (if (null? sequence) initial
      (f (car sequence) 
	 (accumulate f initial (cdr sequence)))))



(define (count-leaves tree)
  (accumulate (lambda (current next)
		(+ (if (not (pair? current)) 1
		    (count-leaves current))
		     next))
		0 tree))

(assert-equals 8 (count-leaves '(((1 2) 3 4) ((1 2) 3 4))))