;; Simposn's Rule for numerical integration
;; Iterative version of `sum`
(use test)
(current-test-epsilon 1e-02)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

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

(test 0.25 (integral cube 0 1 1000))
