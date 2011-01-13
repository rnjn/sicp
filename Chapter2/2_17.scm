(load "../common.scm")

(define (last-pair l)
  (cond
   ((null? l) nil)
   ((null? (cdr l)) l)
   (else 
    (last-pair (cdr l)))))

;tests

(assert-equals '(4) (last-pair (list 1 2 3 4)))
