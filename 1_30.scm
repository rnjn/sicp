(load "common.scm")

(define (summation n1 n2 f next)
  (cond ((> n1 n2) 0)
	(else
	 (+ (f n1)
	    (summation (next n1) n2 f next))))) 


(define (summation-iterative n1 n2 f next)
  (define (isummation n1 n2 state)
    (cond ((> n1 n2) state)
	  (else
	   (isummation (next n1) n2 (+ state (f n1))))))
  (isummation n1 n2 0))

(define (identity i) i)
(define (inc i) (+ i 1))

(define (sum-of-numbers n1 n2 method)
  (method n1 n2 identity inc))

(assert-equals (sum-of-numbers 1 10 summation) 
	       (sum-of-numbers 1 10 summation-iterative))
