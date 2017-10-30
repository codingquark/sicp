(use test)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (next n)
  (+ n 1))

(define (f a) a)

(test 55 (sum f 1 next 10))
(test 720 (product f 1 next 6))

;; Iterative version
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (display a)
    (if (> a b)
        null-value
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(test 55 (sum f 1 next 10))
(test 720 (product f 1 next 6))
