(use test (only micro-benchmark %gettime/microsecs))

(define (timed-prime-test n)
  ;; (newline)
  ;; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (newline)
  (display " *** ")
  (display elapsed-time))

;; The following methods are from the book's example
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (next n)
  (if (= n 2) 3
      (+ n 2)))

(test #t (prime? 2))
(test #t (prime? 3))
(test #f (prime? 4))

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

(search-for-primes 1001 1020) ; ~18us
(search-for-primes 10001 10039) ; ~40ms
(search-for-primes 100001 100045) ; ~130ms
(search-for-primes 1000001 1000039) ; ~400ms
;; From the tests, it seems the speed indeed increase ~2x
