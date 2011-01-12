(load "common.scm")

(define (inc n)
  (+ n 1))

(define zero (lambda (f)
	       (lambda (x) 
		 x)))

(define one (lambda (f)
	      (lambda (x)
		(f x))))

(define two (lambda (f)
	      (lambda (x)
		(f (f x)))))

(define add-1 (lambda (n)
		(lambda (f)
		  (lambda (x) 
		    (f ((n f) x))))))

(define add (lambda (a b)
	      (lambda (f)
		(lambda (x)
		  ((a f) ((b f) x))))))


;tests
(assert-equals 0 ((zero inc) 0))
(assert-equals 1 ((one inc) 0))
(assert-equals 2 ((two inc) 0))

(assert-equals 1 (((add-1 zero) inc) 0))
(assert-equals 2 (((add-1 one) inc) 0))

(assert-equals 2 (((add zero two) inc) 0))
(assert-equals 3 (((add one two) inc) 0))

