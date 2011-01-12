(load "common.scm")

(define (map f l)
  (if (null? l) nil
      (cons (f (car l)) (map f (cdr l)))))

(define (tree-map f tree)
  (cond
   ((null? tree) tree)
   ((not (pair? tree)) (f tree))
   (else
    (cons (tree-map f (car tree)) (tree-map f (cdr tree))))))


(define square (lambda (x) (* x x)))
(define test (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(assert-equals '(1 (4 (9 16) 25) (36 49))
	       (tree-map square test))

