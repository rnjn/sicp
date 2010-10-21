(load "common.scm")



(define (f n)(
	      cond ((< n 3) n)
		   (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))) 

(assert-equals (f 2) 2)
(assert-equals (f 10) 1892)

(define f-iter n)(