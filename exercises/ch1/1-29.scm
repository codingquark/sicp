;; Simposn's Rule for numerical integration
(use test)
(current-test-epsilon 1e-02)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (multiplicand x)
    (cond ((= x 0) 1)
          ((odd? x) 4)
          ((even? x) 2)
          ((= x n) 1)))
  (define (iter i) (* (multiplicand i) (y i)))
  (define (next x) (+ x 1))
  (* (sum iter 1 next n) (/ h 3)))

(define (cube a)
  (* a a a))

;; (test 0.25 (integral cube 0 1 100))
(test 0.25 (integral cube 0 1 1000))


;; In Scheme interpreter:
;; (integral cube 0 1 100)
;; ;Value: 19/75
;; (integral cube 0 1 1000)
;; ;Value: 751/3000
