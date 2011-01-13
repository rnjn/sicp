(load "../common.scm")

; multiply by adding
(define (* a b)
  (cond ((= b 0) 0)
	(else (+ a (* a (- b 1))))))

; multiply by adding with logarithmic growth
(define (double a) (+ a  a))

(define (even? a)
  (= (remainder a 2) 0))

(define (l* a b)
  (cond ((= b 0) 0)
	((even? b) (l* (double a) (/ b 2)))
	(else (+ a (l* a (- b 1))))))


(assert-equals 10 (l* 5 2))
