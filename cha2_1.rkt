#lang sicp
;;;2.7~2.16
(define (add-interval x y)
  (make-interval (+ (lower-bound x ) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (make-interval a b)
  (cons a b))
;;;a and b is number
(define (upper-bound x)
  (cdr x))
(define (lower-bound x)
  (car x))
;;;x is like (cons 2 3)
(min 1 2 3 4)