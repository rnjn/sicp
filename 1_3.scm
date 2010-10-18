(load "common.scm")

;tests
(assert-equals (greater 3 4) 4)

(assert-equals (lesser 3 4) 3)

(assert-equals (sos_of_greater_pair 1 3 4) 25)

(assert-equals (sos_of_greater_pair -1 -3 -4) 10)

(define (sum_of_squares x y) (+ (* x x) (* y y)))

(define (greater x y) 
  (cond ((> x y) x) 
	(else y)))

(define (lesser x y) 
  (cond ((< x y) x) 
	(else y)))

(define (sos_of_greater_pair x y z) ( 
				     sum_of_squares (greater x y) (greater (lesser x y) z)))

