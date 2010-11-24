(load "common.scm")

(define (find-divisor n i)
  (cond ((> (square i) n) n)
	((= (remainder n i) 0) i)
	(else
	 (find-divisor n (+ i 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n ))


(define (find-prime n p start-time)
  (cond ((prime? n)
	 (newline)
	 (display n) 
	 (display " -> time taken : ")
	 (display (- (runtime) start-time))
	 (- p 1))
	(else p)))


(define (search-primes r1 r2 n)
  (cond ((>= (+ r1 2) r2) n)
	((= 0 n) n)
	(else 
	 (search-primes (+ r1 2) r2 (find-prime r1 n (runtime))))))
	
(search-primes 1001 2000 3)
(search-primes 100000001 200000000 3)
(search-primes 1000000001 2000000000 3)
(search-primes 10000000001 20000000000 3)

