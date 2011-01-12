(load "common.scm")

(define (accumulate f initial sequence)
  (if (null? sequence) initial
      (f (car sequence)
	 (accumulate f initial (cdr sequence)))))

(define (map f sequence)
  (accumulate (lambda (x y)
		(cons (f x) (map f (cdr sequence)))) nil sequence))


(define (append seq1 seq2)
  (accumulate cons seq2 seq1))


(define (length sequence)
  (accumulate (lambda (x y)
		(+ 1 y))
	      0 sequence))

;tests
;map
(define square (lambda (x) (* x x)))
(assert-equals '(1 4 9 16) (map square (list 1 2 3 4)))
;append
(assert-equals '(1 2 3 4) (append (list 1 2) (list 3 4)))
;length
(assert-equals 3 (length (list 1 2 3)))
