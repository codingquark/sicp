(define tolerence 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerence))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

;; Some tests
(fixed-point cos 1.0)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

;; Procedure as return values

(define (average-damp f)
  (lambda (x) (average x (f x))))

;; See how cleaner it is.
;; Now we know that we are average damping the y ↦ x/y
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))
