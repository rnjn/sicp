(load "common.scm")

(define (cont-frac n d k)
  (define phi 1.6180)
  (define (next-term i)
    (cond ((= i k) 0) 
	  (else
	   (/ (n i) ( + (d i) (next-term (+ i 1)))))))
  (next-term 1))


(/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 1000))