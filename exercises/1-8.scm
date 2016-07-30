(define (square x)
  (* x x))

(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess))
     0.001))

(define (improve x guess)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (cube-root-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cube-root-iter (improve x guess)
                      guess
                      x)))

(define (cube-root x)
  (cube-root-iter 1.0 0 x))
