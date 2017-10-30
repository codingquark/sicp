;; https://en.wikipedia.org/wiki/Ackermann_function
(use test)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(test 1024 (A 1 10))
(test 65536 (A 2 4))
(test 65536 (A 3 3))

(define (f n) (A 0 n)) ;; 2n
(test 2 (f 1))
(test 4 (f 2))
(test 6 (f 3))
(test 8 (f 4))

(define (g n) (A 1 n)) ;; 2^n
(test 2 (g 1))
(test 4 (g 2))
(test 8 (g 3))
(test 16 (g 4))

(define (h n) (A 2 n)) ;; 
(test 2 (h 1))
(test 4 (h 2))
(test 16 (h 3))
(test 65536 (h 4))

(define (k n) (* 5 n n))
(test 5 (k 1))
(test 20 (k 2))
(test 45 (k 3))
(test 80 (k 4))
