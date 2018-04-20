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
(define (subl-interval x y)
  (add-interval x (- y)))

;;;2_8
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                  (max p1 p2 p3 p4))))

(define (div-interval-modif x y)
  (if (< (* (lower-bound y ) (upper-bound y)) 0)
      (error "we can not do this")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
       


;;;practics 2_10
 (div-interval-modif (cons 2 3) (cons -4 -3))


;;;;practice 2.11
(define (mul-interval-improve x y)
  (cond ((and  (< (lower-bound x) 0) (< (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
        (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        ;;;x (-3 -2) y (-4 -1)==>(2 12)
        ((and (< ( lower-bound x) 0) (< (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
        (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
        ;;;x (-3 -2) y (-5 1) ==> (-2 15)
         ((and (< (lower-bound x) 0) (< (upper-bound x) 0) (> (lower-bound y) 0) (> (upper-bound y) 0))
        (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))
         ;;;;x (-3 -2) y (2 6)=>(-18 -4)
           ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
        (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (lower-bound y))))
           ;;;;x (-3 1) y (-3 -1)=> (-3 9)
             ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
        (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
             ;;;;x (-3 1) y(-2 4) => (-12 6)

               ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (> (lower-bound y) 0) (> (upper-bound y) 0))
        (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))
               ;;;x (-3 1) y(2 4) =>(-12 4)
                 ((and (> (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
        (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y))))
                 ;;;x (1 2) y (-3 -2) =>(-6 -2)

            ((and (> ( lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
        (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
            ;;;;x (1 2) y (-3 2) =>(-6 4)
           (else (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))))
            ;;;;x (1 2) y (3 4) =>(3 8)


(define x1 (make-interval -3 -2))
(define y1 (make-interval -4 -1 ))
(mul-interval-improve x1 y1)

(define x2 (make-interval -3 -2))
(define y2 (make-interval -5 1 ))
(mul-interval-improve x2 y2)


(define x3 (make-interval -3 -2))
(define y3 (make-interval 2 6))
(mul-interval-improve x3 y3)


(define x4 (make-interval -3 1))
(define y4 (make-interval -3 -1 ))
(mul-interval-improve x4 y4)


(define x5 (make-interval -3 1))
(define y5 (make-interval -2 4 ))
(mul-interval-improve x5 y5)


(define x6 (make-interval -3 1))
(define y6 (make-interval 2 4 ))
(mul-interval-improve x6 y6)


(define x7 (make-interval 1 2))
(define y7 (make-interval -3 -2 ))
(mul-interval-improve x7 y7)

(define x8 (make-interval 1 2))
(define y8 (make-interval -3 2 ))
(mul-interval-improve x8 y8)

(define x9 (make-interval 1 2))
(define y9 (make-interval 3 4  ))
(mul-interval-improve x9 y9)


;;;;practics 2.12
(define ( make-center-percent x percent)
(make-interval (* x (- 1 percent))
               (* x (+ 1 percent))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (get-percent i )
  (/ (- (upper-bound i) (center i))
    (center i)))
(define test (make-interval 3.35 3.65))
(define example (get-percent test))
;;;(make-center-percent test (get-percent test))
(make-center-percent (center test) example)