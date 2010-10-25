(load "common.scm")

;recursive
(define (f n)(
	      cond ((<= n 3) n)
		   (else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))) 

		
(assert-equals 2 (f 2))
(assert-equals 10 (f 4))
(assert-equals 22 (f 5))
(assert-equals 51 (f 6))
(assert-equals 1657 (f 10))

;iterative 
;remember the last 2 f's and create the latest one. build till n
(define (f-iter n i a b c)
		  (cond ((= i n) a)
			(else (f-iter n (+ i 1) (+ a (* 2 b) (* 3 c)) a b))))

; start from 3 and build till n		
(define (fi n) 
  (cond ((< n 3) n)
		(else (f-iter n 3 3 2 1))))
		
(assert-equals 2 (fi 2))
(assert-equals 10 (fi 4))
(assert-equals 22 (fi 5))
(assert-equals 51 (fi 6))
(assert-equals 1657 (fi 10))
		