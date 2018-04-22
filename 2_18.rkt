#lang sicp
;;;2_18
;;;x is (1 2 3 4 )
;;;(reverse x )  => ( 4 3  2 1)

;;;2_18
(define (reverse items)
  (define (iter things answer)
    (if (null? things )
         answer
         (iter (cdr things ) 
               (cons (car things) answer))))
  (iter items nil))
;;(define (reverse x)
  ;;(cond ((null? (cdr x ) ) (car x))
    ;;    ((reverse (cdr x)) (cons (car x) nil))))
        
       
       ;;; ((null? (cdr x)) (car x))
       ;;; (else (cons (reverse (cdr x)) (car x)))))
        ;;;;(else  (reverse x) (cons (car x) nil))))
(reverse (list 1 2 3 4 5 6 7 8 ))
(cons 1 (cons 2 (cons 3 (cons 4 nil))))
(pair? (list 3 4))


