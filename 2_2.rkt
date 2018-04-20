#lang sicp
(list 1 2 3 4)
;;;2.2
(define (make-segment x y)
  (cons x y))
;;;x is like (cos 2 3), y is like (cons 3 4)
;;(define (start-segment x)
  ;;;(car x))
;;;(define (end-segment y)

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;;;average process
;;;x and y is number 
(define (average x y)
  (/ (+ x y) 2))
;;;p is like cons(3 4)
(define (midpoint-segment p)
  ;;;p is like (cons (cons 3 4) (cons 4 5))
  (cons (average (x-point (car p)) (x-point (cdr p)))
         (average (y-point (car p)) (y-point (cdr p)))))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;;;;test
(define x (cons 3 4))
(define y (cons 5 4))
(define p (make-segment x y))
(define midpoint (midpoint-segment p))
(print-point midpoint)