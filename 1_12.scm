(load "common.scm")

(define (pascal row col)
  (cond ((or (= row 1) (= col 1) (= col row)) 1)
	(else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

;tests
(assert-equals (pascal 1 1) 1)
(assert-equals (pascal 3 2) 2)
(assert-equals (pascal 5 2) 4)
(assert-equals (pascal 5 3) 6)