(load "../common.scm")

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

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
  (define (sign)
    (cond ((> (* n d) 0) +) (else -)))
  (let ((g (abs (gcd n d))))
    (cons (/ ((sign) 0 (abs n)) g) (/ (abs d) g))))


		  
