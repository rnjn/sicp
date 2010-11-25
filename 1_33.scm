(load "common.scm")

(define (filtered-accumulate combiner filter null-value n1 n2 f next)
  (cond ((> n1 n2) null-value)
	((filter n1)
	 (combiner (f n1)
		   (filtered-accumulate combiner filter null-value (next n1) n2 f next)))
	(else 
	 (filtered-accumulate combiner filter null-value (next n1) n2 f next))))

(define (inc n) (+ n 1))
(define (identity n) n)

(define (square n) (* n n))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor i)
      (cond ((> (square i) n) n)
	    ((= (remainder n i) 0) i)
	    (else
	     (find-divisor (+ i 1)))))
    (find-divisor 2))
  (= (smallest-divisor n) n ))

(define (sum-of-squares-of-primes n1 n2)
  (filtered-accumulate + prime? 0 n1 n2 square inc))

(assert-equals 87 (sum-of-squares-of-primes 2 10))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relative-primes n)
  (define (relative-prime? p)
    (= 1 (gcd p n)))
  (filtered-accumulate * relative-prime? 1 1 n identity inc))

(assert-equals 24 (product-of-relative-primes 5))
(assert-equals 5 (product-of-relative-primes 6))