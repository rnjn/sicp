(load "../common.scm")

(define (product n1 n2 f next)
  (cond ((> n1 n2) 1)
	(else
	 (* (f n1)
	    (product (next n1) n2 f next)))))

(define (product-iterative n1 n2 f next)
  (define (iProduct n state)
    (cond ((> n n2) state)
	  (else
	   (iProduct (next n) (* state (f n))))))
  (iProduct n1 1))


(define (identity i) i)
(define (inc i) (+ i 1))
(define (square n) (* n n))

(define (factorial method n)
  (method 1 n identity inc))

(assert-equals 720 (factorial product 6))
(assert-equals (factorial product 6) (factorial product-iterative 6))

(define (add2 i)
  (+ i 2))

(define (pi-prod n)
  (* n (+ n 2)))

;n > 4
;pi = 4 ( 2 x (4x4) x (6x6)........) / ((3x3) x (5x5).....))
(define (pi method n)
  (* 4.0 (/ 
	  (method 2 n pi-prod add2)
	  (method 3 (+ n 1) square add2))))

(assert-equals (pi product-iterative 10000)  (pi product 10000))

