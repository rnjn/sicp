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

;tests
(define a1 (make-interval 4.0 4.5))
(define a2 (make-interval 3.9 4.1))
(define a1-plus-a2 (add-interval a1 a2))

(assert-equals 8 (lower-bound (make-interval 8 9)))
(assert-equals 9 (upper-bound (make-interval 8 9)))

(assert-equals 7.9 (lower-bound a1-plus-a2))
(assert-equals 8.6 (upper-bound a1-plus-a2))