(load "../common.scm")

(define (accumulate f init sequence)
  (if (null? sequence) init
	     (f (car sequence) (accumulate f init (cdr sequence)))))

(define (accumulate-n f init sequences)
  (if (null? (car sequences)) nil
      (cons (accumulate f init (map car sequences))
	    (accumulate-n f init (map cdr sequences)))))

(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))

(assert-equals '(11 14 17 19) (accumulate-n + 0 m))

