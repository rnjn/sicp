(load "common.scm")

(define (cont-frac n d k)
  (define (next-term i)
    (cond ((> i k) 0) 
	  (else
	   (/ (n i) ( + (d i) (next-term (+ i 1)))))))
  (next-term 1))

(define (min-k)
  (define golden-ratio 1.6180)  
  (define (good-enough? x) (< (abs (- golden-ratio x)) 0.0001))
  (define (iterate k)
    (let ((phi (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))))
      (cond ((good-enough? phi) k)
	    (else
	     (iterate (+ k 1))))))
    (iterate 2))

(assert-equals 11 (min-k))


;count down for iterative
(define (i-cont-frac n d k)
  (define (accumulate i state)
    (cond ((= i k) state)
	  (else
	   (accumulate (+ i 1) (/ (n (- k i)) (+ state (d (- k i))))))))
  (accumulate 0 0))

(assert-equals (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
 (i-cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11))

	       
