(use test)

(define tolerence 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerence))
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

(test 4.55554044840216
      (fixed-point (lambda (x) (/ (log 1000) (log x)))
                   10.0)) ;; 33 iterations

(test 4.55554044840216
      (fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
                   10.0)) ;; 8 iterations
