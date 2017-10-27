(use test)
(current-test-epsilon 1e-04)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx tolerance)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (y) (+ (cube y) (* a (square y)) (* b y) c)))

;; test
(test -1.0 (newtons-method (cubic 3 3 1) 1))
(test -3.1478 (newtons-method (cubic 4 3 1) 1))
