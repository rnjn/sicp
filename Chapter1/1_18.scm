(load "common.scm")

(define (double a)
  (+ a a))

(define (even? a)
  (= (remainder a 2) 0))
	 
;iterative logarithmic multiplication with addition
(define (i* a b s)
  (cond ((= b 0) s)
	((even? b) (i* (double a) (/ b 2) s))
	(else (i* a (- b 1) (+ a s)))))

(define (il* a b)
  (i* a b 0))

(assert-equals 12 (il* 3 4))
(assert-equals 72 (il* 9 8))
