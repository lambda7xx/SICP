#lang sicp
;;;1.32
(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))


(define (accumulate combiner null-value term a next b)
  (define (iter a  result)
    (if (> a b)
       result
        ;;(iter (next a) (combiner null-value (term a))))))
       (combiner (term a) (iter (next a) result))))
  (iter a null-value))


(define (inc x) (+ x 1))
(define (identity x) (* x 1))
(define (cube x) (* x x x))

(define (add-two a b)
  (+ a b))
(define (product-two a b)
  (* a b))

(define (sum  a  b)
  (accumulate-rec add-two 0 cube  a inc b))

(define (sum-iter a b)
   (accumulate add-two 0 cube  a inc b))

(sum 1 10)
(sum-iter 1 10)