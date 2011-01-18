(load "../common.scm")

(define nil '())

(define (fold-right f init sequence)
  (if (null? sequence) init
	     (f (car sequence) (fold-right f init (cdr sequence)))))

(define (fold-left f init sequence)
  (define (iter result rest)
    (if (null? rest) result
	(iter (f result (car rest))
	      (cdr rest))))
  (iter init sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y)
	       (append y (list x)))
	      nil sequence))

(define (reverse-l sequence)
  (fold-left (lambda (x y)
		(cons y x)) 
	      nil sequence))

(assert-equals '(4 3 2 1) (reverse-r '(1 2 3 4)))
(assert-equals '(4 3 2 1) (reverse-l '(1 2 3 4)))
