(use test)
(current-test-epsilon 1e-04)

;; I find recursive definitions much simpler
;; than iterative ones.
(define (cont-frac n d k)
  (define (internal-frac i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (internal-frac (+ i 1))))))
  (internal-frac 1))

(test 1.6180 (/ 1 (cont-frac (lambda (i) 1.0)
                             (lambda (i) 1.0)
                             11)))

;; Iterative version
(define (cont-frac n d k)
  (define (internal-frac i result)
    (if (= i 0)
        result
        (internal-frac (- i 1) (/ (n i) (+ (d i) result)))))
  (internal-frac k 0))

(test 1.6180 (/ 1 (cont-frac (lambda (i) 1.0)
                             (lambda (i) 1.0)
                             11)))
