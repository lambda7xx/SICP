#lang sicp

;;;2_21
(define (square x)
  (* x x))
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items ))
            (map proc (cdr items)))))

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-list items)
  (map square items))
(square-list (list 1 2 3 4 5 6 7 8 9 ))
(square-list-list (list 1 2 3 4 5 6 7 8 9 ))


