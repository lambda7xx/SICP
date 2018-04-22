#lang sicp
(cons 1 (cons 2 (cons 3 (cons 4 nil))))
(list 1 2 3 4)
(cons 1 (cons 2 (cons 3 (cons 4 nil))))
;;;2_17
(define (last-pair x)
  (cond ((null? x)  (error  "x should not be empty"))
        ((null? (cdr x)) (car x))
         (else (last-pair (cdr x)))))
(last-pair (list 1 2 3 4))
(last-pair  (list 3))
