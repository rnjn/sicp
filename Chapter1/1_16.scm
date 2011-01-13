(load "../common.scm")

;recursive
(define (square a)
  (* a a))

(define (even? a)
  (= (remainder a 2) 0))

(define (fast-exp a n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-exp a (/ n 2))))
	(else (* a (fast-exp a (- n 1))))))
	 
;iterative
(define (fast-exp-iter a n p)
  (cond ((= n 0) p)
	((even? n) (fast-exp-iter (square a) (/ n 2) p))
	(else (fast-exp-iter a (- n 1) (* a p)))))

(define (i-fast-exp a n)
  (fast-exp-iter a n 1))

(assert-equals 81 (fast-exp 3 4))
(assert-equals 81 (i-fast-exp 3 4))