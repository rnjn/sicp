(load "common.scm")

(define (compose f g)
  (lambda (i)
    (f (g i))))

(define (repeated f n)
    (cond ((= n 1) f)
	  (else
	     (compose (repeated f (- n 1)) f))))

(define (inc i) (+ i 1))
(assert-equals 6 ((repeated inc 5) 1))
(define (square n) (* n n))
(assert-equals 625 ((repeated square 2) 5))