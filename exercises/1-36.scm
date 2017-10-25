(use test)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (x-raised-to-x y)
  (fixed-point (lambda (x) (/ (log y) (log x)))
               10.0))
(test 4.55554044840216 (x-raised-to-x 1000)) ;; 33 iterations

(define (x-raised-to-x y)
  (fixed-point (lambda (x) (average x (/ (log y) (log x))))
               10.0))
(test 4.55554044840216 (x-raised-to-x 1000)) ;; 8 iterations
