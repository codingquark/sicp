(use test)

(define (pascal row col)
  (cond ((= row col) 1)
        ((= col 0) 1)
        (else
         (+ (pascal (- row 1) (- col 1))
            (pascal (- row 1) col)))))

(test 1 (pascal 0 0))

(test 1 (pascal 1 0))
(test 1 (pascal 1 1))

(test 1 (pascal 2 0))
(test 2 (pascal 2 1))
(test 1 (pascal 2 2))

(test 1 (pascal 3 0))
(test 3 (pascal 3 1))
(test 3 (pascal 3 2))
(test 1 (pascal 3 3))

(test 1 (pascal 4 0))
(test 4 (pascal 4 1))
(test 6 (pascal 4 2))
(test 4 (pascal 4 3))
(test 1 (pascal 4 4))
