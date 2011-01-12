(load "common.scm")

(define (compose f g)
  (lambda (i)
    (f (g i))))

(define (repeated f n)
    (cond ((= n 1) f)
	  (else
	     (compose (repeated f (- n 1)) f))))

(assert-equals 625 ((repeated square 2) 5))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))

(define (n-fold-smooth n)
  (lambda (f)
    ((repeated smooth n) f)))

(((n-fold-smooth 10) (lambda (x) (* x x))) 10)


