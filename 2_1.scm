(load "common.scm")

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (mod a)
  (if (> a 0)
      a
      (- 0 a)))

(define numer (lambda (rat)
		(car rat)))

(define denom (lambda (rat)
		(cdr rat)))

(define print-rat (lambda (rat)
		    (newline)
		    (display (numer rat))
		    (display "/")
		    (display (denom rat))))

(define (make-rat n d)
		  (let ((g (mod (gcd n d))))
		    (cond ((> (* n d) 0) 
			   (cons (/ n g) (/ d g)))
			  (else
			   (cons (/ (- (mod n)) g) (/ (mod d) g))))))
		  

		  
