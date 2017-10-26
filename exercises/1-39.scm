(use test)
(current-test-epsilon 1e-04)

(define (cont-frac n d k)
  (define (internal-frac i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (internal-frac (+ i 1))))))
  (internal-frac 1))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))


;; Tests taken from wasamasa :D
(define pi (* 4 (atan 1)))

(test (tan (/ pi 3)) (tan-cf (/ pi 3) 4))
(test (tan (/ pi 4)) (tan-cf (/ pi 4) 4))
(test (tan (/ pi 6)) (tan-cf (/ pi 6) 4))
(test (tan (/ pi 8)) (tan-cf (/ pi 8) 4))
