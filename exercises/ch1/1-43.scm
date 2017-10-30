(use test)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))

;; Test
(test 625 ((repeated square 2) 5))
