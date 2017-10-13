;; Computes the sum of the integers from a through b
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

;; Sum of the cubes of the integers in the range
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))
(define (cube a)
  (* a a a))

;; Computes the sum of a seq of terms in the series:
;; (1/1·3) +; ((1/5·7)) + (1/9·11) + ···
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; Template for the procudes above
;; (define (<name> a b)
;;   (if (> a b)
;;       0
;;       (+ (<term> a)
;;          (<name> (<next> a) b))))

;; Procedue based on the template
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; Sum of the cubes of the integers in the range
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

;; Computes the sum of a seq of terms in the series:
;; (1/1·3) +; ((1/5·7)) + (1/9·11) + ···
(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

;; Calculates definite integral of a function $f$ between
;; limits a and b
;; $\int_a^b \mathit{f} = [\mathit{f}\left(\mathit{a} + \frac{dx}{2}\right) + \mathit{f}\left(\mathit{a} + dx + \frac{dx}{2}\right) + \mathit{f}\left(\mathit{a} + 2dx + \frac{dx}{2}\right)]dx$
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
