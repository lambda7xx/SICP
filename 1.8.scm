#lang sicp
(define (cube-root-iter y x)
  (if (good-enough? y x)
        y
      (cube-root-iter (improve y x)
                      x)))

(define (improve y x)
  (/ (+(/ x (* y y)) (* 2 y)) 3))

(define (good-enough? y x)
  (< (abs (- (* y y y) x)) 0.0001))

(define (abs x)
  (if (< x  0)
      (- x)
      x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 64)
;;;;SICP problem 1.8
;;;block 1.8
(define (cube-root1 x)
  (define (good-enough? y x)
  (< (abs (- (* y y y) x)) 0.0001))
  (define (improve y x)
  (/ (+(/ x (* y y)) (* 2 y)) 3))
(define (cube-root-iter y x)
  (if (good-enough? y x)
        y
      (cube-root-iter (improve y x)
                      x)))
  (cube-root-iter 1.0 x))
(cube-root1 64)


                