(load "../common.scm")

(define (accumulate combiner null-value n1 n2 f next)
  (cond ((> n1 n2) null-value)
	(else
	 (combiner (f n1)
		   (accumulate combiner null-value (next n1) n2 f next)))))

(define (accumulate-iterative combiner null-value n1 n2 f next)
  (define (iAccumulate n state)
    (cond ((> n n2) state)
	  (else
	   (iAccumulate (next n) (combiner state (f n))))))
  (iAccumulate n1 null-value))

(define (sum  n1 n2 f next)
  (accumulate + 0 n1 n2 f next))

(define (iSum  n1 n2 f next)
  (accumulate-iterative + 0 n1 n2 f next))

(define (product  n1 n2 f next)
  (accumulate * 1 n1 n2 f next))

(define (iProduct  n1 n2 f next)
  (accumulate-iterative * 1 n1 n2 f next))

(define (identity i) i)

(define (inc i) (+ i 1))

(define (sum-of-consec-numbers n1 n2)
  (sum n1 n2 identity inc))

(define (iSum-of-consec-numbers n1 n2)
  (iSum n1 n2 identity inc))

(define (factorial  n)
  (product  1 n identity inc))

(define (iFactorial n)
  (iProduct  1 n identity inc))


(assert-equals 55 (sum-of-consec-numbers 1 10))

(assert-equals (iSum-of-consec-numbers 1 10) (sum-of-consec-numbers 1 10))

(assert-equals 720 (factorial 6))

(assert-equals (iFactorial 6) (factorial 6))




