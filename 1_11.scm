(load "common.scm")

;recursive
(define (f n)(
	      cond ((< n 3) n)
		   (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))) 

(assert-equals (f 2) 2)
(assert-equals (f 4) 10)
(assert-equals (f 5) 22)
(assert-equals (f 6) 51)
(assert-equals (f 10) 1892)

;iterative 
;remember the last 2 f's and create the latest one. build till n
(define (f-iter n i a b c)
		  (cond ((= i n) a)
			(else (f-iter n (+ i 1) (+ a (* 2 b) (* 3 c)) a b))))

; start from 3 and build till n		
(define (fi n) 
  (cond ((< n 3) n)
		(else (f-iter n 3 3 2 1))))
		
(assert-equals (fi 2) 2)
(assert-equals (fi 4) 10)
(assert-equals (fi 5) 22)
(assert-equals (fi 6) 51)
(assert-equals (fi 10) 1892)
		