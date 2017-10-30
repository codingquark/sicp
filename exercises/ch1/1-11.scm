(use test)
;; Recursive definition
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (- n 2))
                 (* 3 (- n 3))))))

;; Iterative defintion
(define (f n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (iter 0 1 2 n))

(test 1 (f 1))
(test 2 (f 2))
(test 4 (f 3))
(test 11 (f 4))
(test 25 (f 5))
(test 59 (f 6))
(test 142 (f 7))
