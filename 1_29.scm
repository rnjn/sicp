(load "common.scm")

(define (summation n1 n2 f next)
  (cond ((> n1 n2) 0)
	(else
	 (+ (f n1)
	    (summation (next n1) n2 f next))))) 

;h/3 (y0 + 2(y2 + y4 +y6 .....) + 4(y1 + y3 + y5 ...))
; h = (n2 - n1)/n (for some n) 
; yk = f(a + kh)

(define (simpsons-method f n1 n2 n h)
  (define (next p)
    (+ p (* 2 h)))
  (* (/ h 3) 
     (+ (f n1)
	(* 2 (summation (+ n1 (* 2 h))  n2 f next))
	(* 4 (summation (+ n1 h) n2 f next)))))

(define (integral f n1 n2 n)
  (simpsons-method f n1 n2 n (* (/ (- n2 n1) n))))

(define (cube n)
  (* n n n))

(integral cube 0 1 10000.0)

	 