(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

;; Using some obervations, we can reduce the steps
;; One might want to define missing procedures
;; such as remainder, square.
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b) (fast-expt b (- n 1)))))

(define (even? n)
  (= (remainder n 2) 0))
