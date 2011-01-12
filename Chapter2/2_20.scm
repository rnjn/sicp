(load "common.scm")

(define (same-parity a . l)
  (define (even? n)
    (= (remainder n 2) 0))
  (define (odd? n)
    (> (remainder n 2) 0))
  (define (parity n)
    (cond 
     ((even? n) even?)
     (else
      odd?)))
  (let ((filter (parity a)))
   (define (filter-next list-remainder filtered-list)
    (cond ((null? list-remainder) filtered-list)
	  ((filter (car list-remainder)) 
	   (filter-next (cdr list-remainder) (append filtered-list (list (car list-remainder)))))
	   (else
	    (filter-next (cdr list-remainder) filtered-list))))
  (filter-next l (list a))))

;tests
(assert-equals (list 1 3 5 7) (same-parity 1 2 3 4 5 6 7))
