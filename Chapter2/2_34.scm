(load "common.scm")

(define (accumulate f initial sequence)
  (if (null? sequence) initial
      (f (car sequence) 
	 (accumulate f initial (cdr sequence)))))


(define (horner-eval x sequence)
  (accumulate (lambda (this next)
		(+ this (* x next)))
	      0 sequence))

(assert-equals 79 (horner-eval 2 (list 1 3 0 5 0 1)))