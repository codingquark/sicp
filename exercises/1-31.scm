(use test)
(current-test-epsilon 1e-02)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

;; `f` and `next` are for factorial calculation
(define (f a) a)

(define (next n)
  (+ n 1))

(test 6 (product f 1 next 3))
(test 24 (product f 1 next 4))

(define (john-wallis n)
  (define (nominator i) (if (odd? i) (+ i 1) (+ i 2)))
  (define (denominator i) (if (odd? i) (+ i 2) (+ i 1)))
  (define (iter i) (/ (nominator i) (denominator i)))
  (product iter 1 next n))

(test 3.14 (* 4 (john-wallis 1000)))

;; Iterative version
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(test 3.14 (* 4 (john-wallis 1000)))
