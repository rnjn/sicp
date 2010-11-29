(load "common.scm")

(define (fixed-point f first-guess)
  (define tolerance 0.0001)
  (define (close-enough? a b)
    (<= (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
	  (cond ((close-enough? guess next) next)
		(else (try next)))))
  (try first-guess))


(define (phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(phi)
	     
		