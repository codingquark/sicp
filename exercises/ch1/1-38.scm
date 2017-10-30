(use test)
(current-test-epsilon 1e-04)

(define (cont-frac n d k)
  (define (internal-frac i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (internal-frac (+ i 1))))))
  (internal-frac 1))


;; REF: https://oeis.org/A003417

(test 2.71828 (+ 2 (cont-frac (lambda (i) 1.0)
                             (lambda (i)
                               (cond ((= i 1) 1)
                                     ((= i 2) 2)
                                     ((= (remainder (- i 2) 3) 0)
                                      (newline)
                                      (* (+ (quotient i 3) 1) 2))
                                     (else 1)))
                             7)))
