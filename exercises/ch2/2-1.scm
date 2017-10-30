(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g ((if (negative? d)
                -
                +)
            (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))

;; Tests
(print-rat (make-rat -1 2))
