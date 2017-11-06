(use test)
;; Apparently, the tests break if we define `cons`, `car`, `cdr` globally.

(define (exp base n)
  (define (iter base i)
    (if (= (remainder base n) 0)
        (iter (/ base n) (+ i 1))
        i))
  (iter base 0))

;; `let` is to avoid test failure
(let ()
  (define (cons a b)
    (* (expt 2 a) (expt 3 b)))
  (define (car z)
    (exp z 2))
  (define (cdr z)
    (exp z 3))
  (test 1 (car (cons 1 2)))
  (test 2 (cdr (cons 1 2))))
