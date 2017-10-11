(use test (only micro-benchmark %gettime/microsecs))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (newline)
  (display " *** ")
  (display elapsed-time))

;; The following methods are from the book's example
;; Fermat's Test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (square x)
  (* x x))

(test #t (fast-prime? 2 5))
(test #t (fast-prime? 3 5))
(test #f (fast-prime? 4 5))

;;

(define runtime %gettime/microsecs)

;; checks for primality of consecutive odd integers
;; in the specified range.

(define (search-for-primes start end)
  (cond ((< start end)
         (timed-prime-test (+ start 2))
         (search-for-primes (+ start 2) end))
         (else
          (newline)
          (display " Done "))))

(search-for-primes 1001 1020) ; ~60us
(search-for-primes 10001 10039) ; ~70ms
(search-for-primes 100001 100045) ; ~80ms
(search-for-primes 1000001 1000039) ; ~90ms
;; As we can see, the growth is really slow compared to ex 1.22 & 1.23
