(load "common.scm")

(define (exp a n)
  (define (i-exp i prod)
    (cond ((= i 0) prod)
	  (else
	   (i-exp (- i 1) (* prod a)))))
  (i-exp n 1))
		  
(define (cons a b)
	       (* (exp 2 a) (exp 3 b)))

(define (exp-of product number)
  (define (i-log i state)
    (cond ((> (remainder state number) 0) i)
	(else
	 (i-log (+ i 1) (/ state number)))))
  (i-log 0 product))

(define (car pair)
  (exp-of pair 2))

(define (cdr pair)
  (exp-of pair 3))

(assert-equals 4 (car (cons 4 11)))
(assert-equals 11 (cdr (cons 4 11)))