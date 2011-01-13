(load "../common.scm")

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (make-interval a b)
  (cons a b))

(define (add-interval x y)
  (make-interval 
   (+ (lower-bound x) (lower-bound y))
   (+ (upper-bound x) (upper-bound y))))

;[a,b] − [c,d] = [a − d, b − c]
(define (sub-interval x y)
  (add-interval x
   (make-interval 
    (- (upper-bound y))
    (- (lower-bound y)))))

;tests - 
(define a (make-interval 4 5))
(define b (make-interval 1 2))
(define a-sub-b (sub-interval a b))

(assert-equals 2 (lower-bound a-sub-b))
(assert-equals 4 (upper-bound a-sub-b))