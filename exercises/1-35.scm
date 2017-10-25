(use test)

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

;; Golden ratio
(test  1.6180327868852458 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))


