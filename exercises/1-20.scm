(use test)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(test 1 (gcd 5 7))
(test 2 (gcd 1024 386))
(test 3 (gcd 3 9))
