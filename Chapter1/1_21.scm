(load "../common.scm")

;i = test divisor, which is initially 2
(define (find-divisor n i)
  (cond ((> (square i) n) n)
	((= (remainder n i) 0) i)
	(else
	 (find-divisor n (+ i 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n ))


(assert-equals 199 (smallest-divisor 199))
(assert-equals 1999 (smallest-divisor 1999))
(assert-equals 7 (smallest-divisor 19999))
