(use test)

;; Defining 0 as:
(define zero (lambda (f) (lambda (x) x)))

;; Defining addition:
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; Defining one, two
;; https://en.wikipedia.org/wiki/Church_encoding#Church_numerals
;; Noteworthy: "The function itself, and not its end result, is the
;;              Church numeral 2."
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

;; https://en.wikipedia.org/wiki/Church_encoding#Calculation_with_Church_numerals
(define (+ a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))

;; The following is incorrect.
;; @TODO: debug
;; (define (+ m n) (lambda (m) (lambda (n) (lambda (f) (lambda (x) (m (f (n f x))))))))

(define inc add1)
(test 0 ((zero inc) 0))
(test 1 (((add-1 zero) inc) 0))
(test 2 (((add-1 (add-1 zero)) inc) 0))

(test 1 ((one inc) 0))
(test 2 ((two inc) 0))
(test 4 (((+ two two) inc) 0))
