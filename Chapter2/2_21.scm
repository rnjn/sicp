(load "../common.scm")

(define (square x) (* x x))

(define (square-list l)
  (if (null? l)
      nil
      (cons (square (car l)) (square-list (cdr l)))))

(assert-equals '(1 4 9 16) (square-list (list 1 2 3 4)))

(define (map f l)
  (if (null? l)
      nil
      (cons (f (car l)) (map f (cdr l)))))

(define (square-list-using-map l)
  (map square l))

(assert-equals '(1 4 9 16) (square-list-using-map (list 1 2 3 4)))

