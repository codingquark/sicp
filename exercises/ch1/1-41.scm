(use test)

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

;; Test
(test 21 (((double (double double)) inc) 5))
