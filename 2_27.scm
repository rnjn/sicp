(load "common.scm")

(define (reverse l)
  (define (iterate items reversed-list)
    (cond ((null? items) reversed-list)
	  (else
	   (iterate (cdr items) (cons (car items) reversed-list)))))
  (iterate l '()))

(assert-equals (list 4 3 2 1) (reverse (list 1 2 3 4)))
(assert-equals '((3 4) (1 2)) (reverse (list (list 1 2) (list 3 4))))

(define (deep-reverse l)
  (define (iterate items result)
    (cond ((null? items) result)
	  (else
	   (iterate (cdr items) (cons (reverse (car items)) result)))))
  (iterate l '()))

(assert-equals '((6 5 4) (3 2 1)) (deep-reverse (list (list 1 2 3) (list 4 5 6))))