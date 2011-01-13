(load "../common.scm")

(define (map f l)
  (if (null? l) nil
      (cons (f (car l)) (map f (cdr l)))))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (l)
			   (cons (car s) l))
			  rest)))))

