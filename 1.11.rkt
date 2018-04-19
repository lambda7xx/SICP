#lang sicp
;;;1.11
(define (recur-f n)
  (if (< n 3)
      n
      (+ (recur-f (- n 1)) (* 2 (recur-f (- n 2))) (* 3 (recur-f (- n 3))))))
(recur-f 6)
(define (Iterative-f n)
  (Iterative-f-iter 2 1 0 n))
(define (Iterative-f-iter a b c n)
  (cond ((= n 0) c)
        ((= n 1) b)
        ((= n 2) a)
  
      (else ( Iterative-f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))
(Iterative-f 6)