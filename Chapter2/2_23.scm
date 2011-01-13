(load "../common.scm")

(define (for-each f l)
  (if (not (null? l))	
      ((lambda ()
	(f (car l))
	(for-each f (cdr l))))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))