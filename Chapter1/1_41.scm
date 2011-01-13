(load "../common.scm")

(define (inc i) (+ i 1))

(define (double f)
  (lambda (i)
    (f (f i))))

(assert-equals 3 ((double inc) 1))
(assert-equals 21 (((double (double double)) inc) 5))
 