#lang sicp
(define (rec-product term  a next b)
  (if (> a b)
      1
      (* (term a)
         (rec-product term (next a ) next b))))

(define (iter-product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a ) (* result (term a)))))
  (iter a 1))
;;;product of fib of 10
(define (inc x ) (+ x 1))
(define (identity x) x)
(define (iter-product-integer a b)
  (iter-product identity a inc b))
(iter-product-integer 1 7)