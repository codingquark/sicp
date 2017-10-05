;; I saw the book citing Knuth, and I opened it out of
;; excitement. So no original work here.
;; even?, floor are already defined in R5RS

(use test)

(define (expt x n)
  (expt-itr x n 1))

(define (expt-itr x n Y)
  (cond ((= n 0) Y)
        ((even? n) (expt-itr (* x x)
                             (floor (/ n 2))
                             Y))
        (else (expt-itr (* x x)
                        (floor (/ n 2))
                        (* x Y)))))

(test 243 (expt 3 5))
(test 1024 (expt 2 10))
(test 65536 (expt 16 4))
