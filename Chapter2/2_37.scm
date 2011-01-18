(load "../common.scm")

(define (accumulate f initial sequence)
  (if (null? sequence) initial
      (f (car sequence) 
	 (accumulate f initial (cdr sequence)))))

(define (accumulate-n f init sequences)
  (if (null? (car sequences)) nil
      (cons (accumulate f init (map car sequences))
	    (accumulate-n f init (map cdr sequences)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x)
	 (dot-product x v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

;tests
(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define v '(1 2 3 4))
(define w '(6 7 8 9))
(define x '(1 2 3))
(assert-equals 80 (dot-product v w))
(assert-equals '(30 56 80) (matrix-*-vector m v))


