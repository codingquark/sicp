(use test)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (non-trivial-square-root (expmod base (/ exp 2) m) m)
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(define (square x)
  (* x x))

(define (non-trivial-square-root x n)
  (define rem (remainder (square x) n))
  (if (and (not (= x 1)) (not (= x (- n 1)))
           (= rem 1))
      0
      rem))

;; primes
(test #t (fast-prime? 23 5))
(test #t (fast-prime? 137 5))
(test #t (fast-prime? 373 5))
(test #t (fast-prime? 773 5))
(test #t (fast-prime? 911 5))

;; carmichael numbers
(test #f (fast-prime? 561 5))
(test #f (fast-prime? 1105 5))
(test #f (fast-prime? 1729 5))
(test #f (fast-prime? 2465 5))
(test #f (fast-prime? 2821 5))
(test #f (fast-prime? 6601 5))
